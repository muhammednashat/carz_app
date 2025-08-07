import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
      navigate(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              getIconPath("icon_app.png"),
              width: 150.0,
              height: 150.0,
            ),
            Text.rich(
              TextSpan(
                text: "CA",
                style: Theme.of(context).textTheme.headlineLarge,
                children: [
                  TextSpan(
                    text: "R",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: AppTheme.accent),
                  ),
                  TextSpan(
                    text: "Z",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigate(BuildContext context){
    Future.delayed(
      Duration(seconds: 3),
      ()=>{
        context.go(Routes.loginScreen)
      }
    );
  }
}
