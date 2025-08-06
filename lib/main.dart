import 'dart:ui';

import 'package:carz_app/config/app_locale.dart';
import 'package:carz_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final FlutterLocalization localization = FlutterLocalization.instance;
  await localization.ensureInitialized();
  runApp( MyApp() );
}
