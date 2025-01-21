import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Welcome section
          'welcome.title': 'Welcome to ONDC',
          'welcome.subtitle': 'Let\'s create your digital store',
          'welcome.get_started': 'Get Started',
          
          // Language section
          'language.select': 'Choose Your Language',
          'language.english': 'English',
          'language.hindi': 'हिंदी',
          'language.punjabi': 'ਪੰਜਾਬੀ',
          'language.bengali': 'বাংলা',
          
          // Store details section
          'store_details.title': 'Store Information',
          'store_details.store_name': 'Store Name',
          'store_details.store_name_hint': 'Enter your store name',
          'store_details.owner_name': 'Owner Name',
          'store_details.owner_name_hint': 'Enter owner\'s name',
          'store_details.phone': 'Phone Number',
          'store_details.phone_hint': 'Enter your phone number',
          'store_details.gst': 'GST Number',
          'store_details.gst_hint': 'Enter your GST number',
          'store_details.address': 'Store Address',
          'store_details.address_hint': 'Enter your store address',
          'store_details.pin_code': 'PIN Code',
          'store_details.pin_code_hint': 'Enter your area PIN code',
          'store_details.missing_fields': 'Please fill in all required fields',
          'store_details.submission_success': 'Store details submitted successfully',
          
          // Business section
          'business.type': 'Business Type',
          'business.select_type': 'Select your business type',
          'business.kirana': 'Kirana Store',
          'business.grocery': 'Grocery Store',
          'business.pharmacy': 'Pharmacy',
          'business.clothing': 'Clothing',
          'business.electronics': 'Electronics',
          'business.other': 'Other',
          
          // Common section
          'common.step': 'Step',
          'common.next': 'Next',
          'common.back': 'Back',
          'common.save': 'Save',
          'common.cancel': 'Cancel',
          'common.done': 'Done',
          'common.error': 'Error',
          'common.success': 'Success',
          'common.loading': 'Loading...',
          'common.finish': 'Finish',
          'common.moved_to_step': 'Moved to step {}',
          
          // Voice section
          'voice.start': 'Tap to start voice input',
          'voice.listening': 'Listening...',
          'voice.speak_now': 'Please speak now',
          'voice.not_recognized': 'Sorry, could not understand',
        },
        
        'hi_IN': {
          // Welcome section
          'welcome.title': 'ONDC में आपका स्वागत है',
          'welcome.subtitle': 'आइए आपकी डिजिटल दुकान बनाएं',
          'welcome.get_started': 'शुरू करें',
          
          // Language section
          'language.select': 'अपनी भाषा चुनें',
          'language.english': 'English',
          'language.hindi': 'हिंदी',
          'language.punjabi': 'ਪੰਜਾਬੀ',
          'language.bengali': 'বাংলা',
          
          // Store details section
          'store_details.title': 'दुकान की जानकारी',
          'store_details.store_name': 'दुकान का नाम',
          'store_details.store_name_hint': 'अपनी दुकान का नाम दर्ज करें',
          'store_details.owner_name': 'मालिक का नाम',
          'store_details.owner_name_hint': 'मालिक का नाम दर्ज करें',
          'store_details.phone': 'फोन नंबर',
          'store_details.phone_hint': 'अपना फोन नंबर दर्ज करें',
          'store_details.gst': 'जीएसटी नंबर',
          'store_details.gst_hint': 'अपना जीएसटी नंबर दर्ज करें',
          'store_details.address': 'दुकान का पता',
          'store_details.address_hint': 'अपनी दुकान का पता दर्ज करें',
          'store_details.pin_code': 'पिन कोड',
          'store_details.pin_code_hint': 'अपने क्षेत्र का पिन कोड दर्ज करें',
          'store_details.missing_fields': 'कृपया सभी आवश्यक फ़ील्ड भरें',
          'store_details.submission_success': 'दुकान की जानकारी सफलतापूर्वक जमा की गई',
          
          // Business section
          'business.type': 'व्यवसाय का प्रकार',
          'business.select_type': 'अपने व्यवसाय का प्रकार चुनें',
          'business.kirana': 'किराना स्टोर',
          'business.grocery': 'ग्रोसरी स्टोर',
          'business.pharmacy': 'फार्मेसी',
          'business.clothing': 'कपड़ों की दुकान',
          'business.electronics': 'इलेक्ट्रॉनिक्स',
          'business.other': 'अन्य',
          
          // Common section
          'common.step': 'चरण',
          'common.next': 'अगला',
          'common.back': 'पीछे',
          'common.save': 'सहेजें',
          'common.cancel': 'रद्द करें',
          'common.done': 'हो गया',
          'common.error': 'त्रुटि',
          'common.success': 'सफल',
          'common.loading': 'लोड हो रहा है...',
          'common.finish': 'समाप्त करें',
          'common.moved_to_step': 'चरण {} पर पहुंचे',
          
          // Voice section
          'voice.start': 'वॉइस इनपुट शुरू करने के लिए टैप करें',
          'voice.listening': 'सुन रहा हूं...',
          'voice.speak_now': 'कृपया अब बोलें',
          'voice.not_recognized': 'क्षमा करें, समझ नहीं आया',
        },
        
        'pa_IN': {
          // Welcome section
          'welcome.title': 'ONDC ਵਿੱਚ ਜੀ ਆਇਆਂ ਨੂੰ',
          'welcome.subtitle': 'ਆਓ ਤੁਹਾਡੀ ਡਿਜੀਟਲ ਦੁਕਾਨ ਬਣਾਈਏ',
          'welcome.get_started': 'ਸ਼ੁਰੂ ਕਰੀਏ',
          
          // Language section
          'language.select': 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ',
          'language.english': 'English',
          'language.hindi': 'हिंदी',
          'language.punjabi': 'ਪੰਜਾਬੀ',
          'language.bengali': 'বাংলা',
          
          // Store details section
          'store_details.title': 'ਦੁਕਾਨ ਦੀ ਜਾਣਕਾਰੀ',
          'store_details.store_name': 'ਦੁਕਾਨ ਦਾ ਨਾਮ',
          'store_details.store_name_hint': 'ਆਪਣੀ ਦੁਕਾਨ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ',
          'store_details.owner_name': 'ਮਾਲਕ ਦਾ ਨਾਮ',
          'store_details.owner_name_hint': 'ਮਾਲਕ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ',
          'store_details.phone': 'ਫ਼ੋਨ ਨੰਬਰ',
          'store_details.phone_hint': 'ਆਪਣਾ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ',
          'store_details.gst': 'ਜੀਐਸਟੀ ਨੰਬਰ',
          'store_details.gst_hint': 'ਆਪਣਾ ਜੀਐਸਟੀ ਨੰਬਰ ਦਰਜ ਕਰੋ',
          'store_details.address': 'ਦੁਕਾਨ ਦਾ ਪਤਾ',
          'store_details.address_hint': 'ਆਪਣੀ ਦੁਕਾਨ ਦਾ ਪਤਾ ਦਰਜ ਕਰੋ',
          'store_details.pin_code': 'ਪਿੰਨ ਕੋਡ',
          'store_details.pin_code_hint': 'ਆਪਣੇ ਖੇਤਰ ਦਾ ਪਿੰਨ ਕੋਡ ਦਰਜ ਕਰੋ',
          'store_details.missing_fields': 'ਕਿਰਪਾ ਕਰਕੇ ਸਾਰੇ ਲੋੜੀਂਦੇ ਖੇਤਰ ਭਰੋ',
          'store_details.submission_success': 'ਦੁਕਾਨ ਦੀ ਜਾਣਕਾਰੀ ਸਫਲਤਾਪੂਰਵਕ ਜਮ੍ਹਾਂ ਕੀਤੀ ਗਈ',
          
          // Business section
          'business.type': 'ਕਾਰੋਬਾਰ ਦੀ ਕਿਸਮ',
          'business.select_type': 'ਆਪਣੇ ਕਾਰੋਬਾਰ ਦੀ ਕਿਸਮ ਚੁਣੋ',
          'business.kirana': 'ਕਰਿਆਨਾ ਸਟੋਰ',
          'business.grocery': 'ਗਰੋਸਰੀ ਸਟੋਰ',
          'business.pharmacy': 'ਫਾਰਮੇਸੀ',
          'business.clothing': 'ਕੱਪੜੇ ਦੀ ਦੁਕਾਨ',
          'business.electronics': 'ਇਲੈਕਟ੍ਰੌਨਿਕਸ',
          'business.other': 'ਹੋਰ',
          
          // Common section
          'common.step': 'ਪੜਾਅ',
          'common.next': 'ਅੱਗੇ',
          'common.back': 'ਪਿੱਛੇ',
          'common.save': 'ਸੇਵ ਕਰੋ',
          'common.cancel': 'ਰੱਦ ਕਰੋ',
          'common.done': 'ਹੋ ਗਿਆ',
          'common.error': 'ਗਲਤੀ',
          'common.success': 'ਸਫਲ',
          'common.loading': 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...',
          'common.finish': 'ਖਤਮ ਕਰੋ',
          'common.moved_to_step': 'ਪੜਾਅ {} \'ਤੇ ਪਹੁੰਚ ਗਏ',
          
          // Voice section
          'voice.start': 'ਵੌਇਸ ਇਨਪੁੱਟ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ',
          'voice.listening': 'ਸੁਣ ਰਿਹਾ ਹਾਂ...',
          'voice.speak_now': 'ਕਿਰਪਾ ਕਰਕੇ ਹੁਣ ਬੋਲੋ',
          'voice.not_recognized': 'ਮਾਫ਼ ਕਰਨਾ, ਸਮਝ ਨਹੀਂ ਆਇਆ',
        },
        
        'bn_IN': {
          // Welcome section
          'welcome.title': 'ONDC-তে স্বাগতম',
          'welcome.subtitle': 'আপনার ডিজিটাল দোকান তৈরি করি',
          'welcome.get_started': 'শুরু করুন',
          
          // Language section
          'language.select': 'আপনার ভাষা বাছুন',
          'language.english': 'English',
          'language.hindi': 'हिंदी',
          'language.punjabi': 'ਪੰਜਾਬੀ',
          'language.bengali': 'বাংলা',
          
          // Store details section
          'store_details.title': 'দোকানের তথ্য',
          'store_details.store_name': 'দোকানের নাম',
          'store_details.store_name_hint': 'আপনার দোকানের নাম লিখুন',
          'store_details.owner_name': 'মালিকের নাম',
          'store_details.owner_name_hint': 'মালিকের নাম লিখুন',
          'store_details.phone': 'ফোন নম্বর',
          'store_details.phone_hint': 'আপনার ফোন নম্বর লিখুন',
          'store_details.gst': 'জিএসটি নম্বর',
          'store_details.gst_hint': 'আপনার জিএসটি নম্বর লিখুন',
          'store_details.address': 'দোকানের ঠিকানা',
          'store_details.address_hint': 'আপনার দোকানের ঠিকানা লিখুন',
          'store_details.pin_code': 'পিন কোড',
          'store_details.pin_code_hint': 'আপনার এলাকার পিন কোড লিখুন',
          'store_details.missing_fields': 'অনুগ্রহ করে সমস্ত প্রয়োজনীয় ক্ষেত্র পূরণ করুন',
          'store_details.submission_success': 'দোকানের তথ্য সফলভাবে জমা দেওয়া হয়েছে',
          
          // Business section
          'business.type': 'ব্যবসার ধরন',
          'business.select_type': 'আপনার ব্যবসার ধরন নির্বাচন করুন',
          'business.kirana': 'কিরানা স্টোর',
          'business.grocery': 'মুদির দোকান',
          'business.pharmacy': 'ফার্মেসি',
          'business.clothing': 'পোশাকের দোকান',
          'business.electronics': 'ইলেকট্রনিক্স',
          'business.other': 'অন্যান্য',
          
          // Common section
          'common.step': 'ধাপ',
          'common.next': 'পরবর্তী',
          'common.back': 'পিছনে',
          'common.save': 'সংরক্ষণ করুন',
          'common.cancel': 'বাতিল করুন',
          'common.done': 'সম্পন্ন',
          'common.error': 'ত্রুটি',
          'common.success': 'সফল',
          'common.loading': 'লোড হচ্ছে...',
          'common.finish': 'শেষ করুন',
          'common.moved_to_step': 'ধাপ {} এ চলে গেছে',
          
          // Voice section
          'voice.start': 'ভয়েস ইনপুট শুরু করতে ট্যাপ করুন',
          'voice.listening': 'শুনছি...',
          'voice.speak_now': 'অনুগ্রহ করে এখন বলুন',
          'voice.not_recognized': 'দুঃখিত, বুঝতে পারিনি',
        },
      };
}