
import 'package:carz_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final FlutterLocalization localization = FlutterLocalization.instance;
  await localization.ensureInitialized();
  runApp( 
    ProviderScope(
    child:   MyApp()
 ) 
    
    );
}
