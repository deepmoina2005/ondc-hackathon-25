import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class VoiceAssistButton extends StatelessWidget {
  const VoiceAssistButton({Key? key}) : super(key: key);

  OnboardingController? get controller {
    try {
      return Get.find<OnboardingController>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return const SizedBox.shrink();

    return Obx(() {
      final bool isListening = controller!.isListening.value;
      final bool isProcessing = controller!.isProcessing.value;
      final String errorMessage = controller!.errorMessage.value;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: isProcessing ? null : _handlePress,
            backgroundColor: _getButtonColor(isListening, isProcessing),
            child: _buildButtonIcon(isListening, isProcessing),
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      );
    });
  }

  void _handlePress() {
    if (controller?.isListening.value ?? false) {
      controller?.stopListening();
    } else {
      controller?.startListening();
    }
  }

  Color _getButtonColor(bool isListening, bool isProcessing) {
    if (isProcessing) return Colors.grey;
    if (isListening) return Colors.red;
    return Get.theme.primaryColor;
  }

  Widget _buildButtonIcon(bool isListening, bool isProcessing) {
    if (isProcessing) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }

    return Icon(
      isListening ? Icons.mic : Icons.mic_none,
      color: Colors.white,
    );
  }
}