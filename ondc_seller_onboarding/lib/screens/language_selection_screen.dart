import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_screen.dart';
import '../config/theme.dart';
import 'package:ondc_seller_onboarding/widgets/language_card.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {
      'code': 'en_US',
      'country': 'US',
      'name': 'English',
      'native': 'English',
      'icon': '🇺🇸'
    },
    {
      'code': 'hi_IN',
      'country': 'IN',
      'name': 'Hindi',
      'native': 'हिंदी',
      'icon': '🇮🇳'
    },
    {
      'code': 'pa_IN',
      'country': 'IN',
      'name': 'Punjabi',
      'native': 'ਪੰਜਾਬੀ',
      'icon': '🇮🇳'
    },
    {
      'code': 'bn_IN',
      'country': 'IN',
      'name': 'Bengali',
      'native': 'বাংলা',
      'icon': '🇮🇳'
    },
  ];

  void _handleLanguageSelection(String languageCode, String country) {
    // Update the locale
    final locale = Locale(languageCode, country);
    Get.updateLocale(locale);
    
    // Navigate to welcome screen
    Get.off(
      () => WelcomeScreen(),
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Language',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Select your preferred language to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    return LanguageCard(
                      languageData: language,
                      onSelect: () => _handleLanguageSelection(
                        language['code'],
                        language['country'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}