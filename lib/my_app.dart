import 'dart:ui';

import 'package:carz_app/config/app_locale.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;

    return MaterialApp(
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      locale: localization.currentLocale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home:  Test(),
    );
  }

  @override
  void initState() {
   String deviceLanguage = PlatformDispatcher.instance.locale.languageCode;
   final FlutterLocalization localization = FlutterLocalization.instance;
  localization.init(
    mapLocales: [
      const MapLocale('en', AppLocale.EN),
      const MapLocale('ar', AppLocale.AR),
    ],
    initLanguageCode:deviceLanguage, 
  );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

 void _onTranslatedLanguage(Locale? locale){
     setState(() {
      print("_onTranslatedLanguage to => $locale");
     });
 }

  
}
