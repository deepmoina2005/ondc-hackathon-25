import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final SpeechToText speechToText = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  
  // State variables
  RxBool isListening = false.obs;
  RxString currentStep = '1'.obs;
  RxMap<String, String> storeData = <String, String>{}.obs;
  RxBool isSpeaking = false.obs;
  RxString currentLocale = 'en'.obs;
  RxBool isProcessing = false.obs;
  RxString errorMessage = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    initializeSpeech();
    initializeTTS();
  }

  @override
  void onClose() {
    speechToText.stop();
    flutterTts.stop();
    super.onClose();
  }

  Future<void> initializeSpeech() async {
    try {
      bool available = await speechToText.initialize(
        onError: (error) => handleError('Speech recognition error: $error'),
        onStatus: (status) => handleSpeechStatus(status),
      );
      
      if (available) {
        var locales = await speechToText.locales();
        var currentLocale = locales.firstWhere(
          (locale) => locale.localeId.startsWith(Get.locale?.languageCode ?? 'en'),
          orElse: () => locales.first,
        );
        await speechToText.listen(localeId: currentLocale.localeId);
      } else {
        handleError('Speech recognition not available');
      }
    } catch (e) {
      handleError('Error initializing speech: $e');
    }
  }

  Future<void> initializeTTS() async {
    try {
      await flutterTts.setLanguage(currentLocale.value);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);
      
      flutterTts.setCompletionHandler(() {
        isSpeaking.value = false;
      });
      
      flutterTts.setErrorHandler((msg) {
        isSpeaking.value = false;
        handleError('TTS error: $msg');
      });
    } catch (e) {
      handleError('Error initializing TTS: $e');
    }
  }

  Future<void> startListening() async {
    if (!isListening.value && !isProcessing.value) {
      try {
        isProcessing.value = true;
        errorMessage.value = '';
        
        await speak('voice.speak_now'.tr);
        
        isListening.value = true;
        await speechToText.listen(
          onResult: (result) {
            if (result.finalResult) {
              handleVoiceInput(result.recognizedWords);
            }
          },
          localeId: currentLocale.value,
          listenMode: ListenMode.confirmation,
          cancelOnError: true,
        );
      } catch (e) {
        handleError('Error starting voice input: $e');
      } finally {
        isProcessing.value = false;
      }
    }
  }

  Future<void> stopListening() async {
    if (isListening.value) {
      try {
        await speechToText.stop();
        isListening.value = false;
      } catch (e) {
        handleError('Error stopping voice input: $e');
      }
    }
  }

  void handleVoiceInput(String text) {
    if (text.isEmpty) {
      speak('voice.not_recognized'.tr);
      return;
    }

    text = text.toLowerCase();
    
    // Navigation commands
    if (text.contains('next') || text.contains('आगे') || text.contains('پڑھو')) {
      moveToNextStep();
      return;
    }
    
    if (text.contains('back') || text.contains('पीछे') || text.contains('واپس')) {
      moveToPreviousStep();
      return;
    }

    // Step-specific handling
    switch (currentStep.value) {
      case '1':
        if (text.contains('store') || text.contains('दुकान') || text.contains('سٹور')) {
          String storeName = extractStoreName(text);
          updateStoreData('storeName', storeName);
          speak('store_details.name_confirmed'.trParams({'name': storeName}));
        }
        break;
        
      case '2':
        if (text.contains('name') || text.contains('नाम') || text.contains('نام')) {
          String ownerName = extractName(text);
          updateStoreData('ownerName', ownerName);
          speak('store_details.owner_confirmed'.trParams({'name': ownerName}));
        }
        break;
        
      case '3':
        if (text.contains('phone') || text.contains('फोन') || text.contains('فون')) {
          String phone = extractNumbers(text);
          if (isValidPhone(phone)) {
            updateStoreData('phone', phone);
            speak('store_details.phone_confirmed'.trParams({'phone': phone}));
          } else {
            speak('store_details.invalid_phone'.tr);
          }
        }
        break;
        
      case '4':
        if (text.contains('address') || text.contains('पता') || text.contains('پتہ')) {
          String address = extractAddress(text);
          updateStoreData('address', address);
          speak('store_details.address_confirmed'.trParams({'address': address}));
        }
        break;
        
      case '5':
        handleBusinessTypeVoiceInput(text);
        break;
    }
  }

  void handleBusinessTypeVoiceInput(String text) {
    final businessTypes = {
      'kirana': ['kirana', 'किराना', 'کریانہ'],
      'grocery': ['grocery', 'ग्रोसरी', 'گروسری'],
      'pharmacy': ['pharmacy', 'फार्मेसी', 'فارمیسی'],
      'clothing': ['clothing', 'कपड़े', 'کپڑے'],
      'electronics': ['electronics', 'इलेक्ट्रॉनिक्स', 'الیکٹرانکس'],
      'other': ['other', 'अन्य', 'دیگر']
    };

    for (var entry in businessTypes.entries) {
      if (entry.value.any((term) => text.contains(term))) {
        updateStoreData('businessType', 'business.${entry.key}');
        speak('store_details.business_type_confirmed'.trParams({'type': 'business.${entry.key}'.tr}));
        return;
      }
    }
  }

  String extractStoreName(String text) {
    final wordsToRemove = ['store', 'shop', 'name', 'called', 'is', 'दुकान', 'का', 'नाम', 'سٹور', 'نام'];
    for (var word in wordsToRemove) {
      text = text.replaceAll(word, '');
    }
    return text.trim().split(' ').map((word) => word.capitalize).join(' ');
  }

  String extractName(String text) {
    final wordsToRemove = ['name', 'my', 'is', 'नाम', 'मेरा', 'نام', 'میرا'];
    for (var word in wordsToRemove) {
      text = text.replaceAll(word, '');
    }
    return text.trim().split(' ').map((word) => word.capitalize).join(' ');
  }

  String extractNumbers(String text) {
    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }

  String extractAddress(String text) {
    final wordsToRemove = ['address', 'location', 'at', 'is', 'पता', 'स्थान', 'پتہ', 'مقام'];
    for (var word in wordsToRemove) {
      text = text.replaceAll(word, '');
    }
    return text.trim();
  }

  bool isValidPhone(String phone) {
    return phone.length >= 10 && phone.length <= 12;
  }

  Future<void> speak(String text) async {
    if (!isSpeaking.value) {
      try {
        isSpeaking.value = true;
        await flutterTts.speak(text);
      } catch (e) {
        isSpeaking.value = false;
      }
    }
  }


  void updateStoreData(String key, String value) {
    storeData[key] = value;
    update();
  }

  void moveToNextStep() {
    int currentStepInt = int.parse(currentStep.value);
    if (currentStepInt < 6) {
      currentStep.value = (currentStepInt + 1).toString();
      // Clear the next step's data
      switch (currentStep.value) {
        case '2':
          storeData.remove('ownerName');
          break;
        case '3':
          storeData.remove('phone');
          break;
        case '4':
          storeData.remove('gst');
          break;
        case '5':
          storeData.remove('address');
          break;
        case '6':
          storeData.remove('businessType');
          break;
      }
      update();
    }
  }

  void moveToPreviousStep() {
    int currentStepInt = int.parse(currentStep.value);
    if (currentStepInt > 1) {
      currentStep.value = (currentStepInt - 1).toString();
      update();
    }
  }

  void handleSpeechStatus(String status) {
    switch (status) {
      case 'listening':
        isListening.value = true;
        break;
      case 'notListening':
        isListening.value = false;
        break;
      case 'done':
        isListening.value = false;
        break;
    }
  }

  void handleError(String error) {
    errorMessage.value = error;
    isProcessing.value = false;
    isListening.value = false;
    isSpeaking.value = false;
    update();
  }

  Future<void> changeLanguage(String languageCode) async {
    currentLocale.value = languageCode;
    await initializeTTS();
    update();
  }
}