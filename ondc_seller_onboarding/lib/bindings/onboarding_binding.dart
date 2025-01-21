// lib/bindings/onboarding_binding.dart
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController(), permanent: true);  // Make it permanent so it stays alive
  }
}