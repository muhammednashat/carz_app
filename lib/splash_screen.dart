import 'package:carz_app/config/dependeces.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
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

  navigate() async {
    final appBox = await ref.read(appBoxProvider.future);
    await Future.delayed(Durations.long4);
    // context.go(Routes.loginScreen);

    if (appBox.get(Constants.isLogged, defaultValue: false)) {
      context.go(Routes.appBottomTabBar);
    } else {
      context.go(Routes.loginScreen);
    }
  }
}
