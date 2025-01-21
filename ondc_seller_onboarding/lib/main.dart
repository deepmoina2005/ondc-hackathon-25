import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondc_seller_onboarding/config/theme.dart';
import 'package:ondc_seller_onboarding/screens/splash_screen.dart';
import 'package:ondc_seller_onboarding/bindings/onboarding_binding.dart';
import 'package:ondc_seller_onboarding/widgets/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('pa'),
        Locale('bn'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: const Locale('en'),
      useFallbackTranslations: true,
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: OnboardingBinding(),
      translations: Messages(),
      title: 'ONDC Seller Onboarding',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primaryColor,
          secondary: AppTheme.secondaryColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppTheme.buttonStyle,
        ),
        inputDecorationTheme: AppTheme.inputDecorationTheme,
        scaffoldBackgroundColor: AppTheme.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}