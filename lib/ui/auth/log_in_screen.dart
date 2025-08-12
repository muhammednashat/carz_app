import 'package:carz_app/config/app_locale.dart';
import 'package:carz_app/config/dependeces.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/auth/social_account_button.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final List<TextEditingController> controllers = List.generate(
    2,
    (index) => TextEditingController(),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  Image.asset(
                    width: 100.0,
                    height: 100.0,
                    getIconPath("icon_app.png"),
                  ),

                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocale.welcome.getString(context),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Image.asset(
                        getIconPath("waving_hand.png"),
                        width: 35.0,
                        height: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(height: 8.0),
                  Text(AppLocale.loginingText.getString(context)),

                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Feild is required";
                      }
                      return null;
                    },
                    controller: controllers[0],
                    decoration: InputDecoration(
                      hintText: AppLocale.emailAddress.getString(context),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Feild is required";
                      }
                      return null;
                    },
                    controller: controllers[1],
                    decoration: InputDecoration(
                      hintText: AppLocale.password.getString(context),
                    ),
                  ),

                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocale.forgotPassword.getString(context),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppTheme.accent),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _onPressed();
                      } else {
                        _onPressed();
                      }
                    },
                    text: AppLocale.login.getString(context),
                  ),
                  SizedBox(height: 8),
                  Text(AppLocale.useSocialMedia.getString(context)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialAccountButton(
                        onPressed: () {},
                        text: AppLocale.google.getString(context),
                        imageName: "google.png",
                      ),

                      SizedBox(width: 16.0),
                      SocialAccountButton(
                        onPressed: () {},
                        text: AppLocale.facebook.getString(context),
                        imageName: "facebook.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text.rich(
                    TextSpan(
                      text: AppLocale.noAccountSignup.getString(context),
                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(
                                    '${Routes.loginScreen}/${Routes.signUpScreen}',
                                  );
                                },
                          text: AppLocale.signup.getString(context),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppTheme.accent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onPressed() async {
    final repo = ref.watch(authRepoProvider);
    final email = 'es';
    // final email = controllers[0].text;
    final user = await repo.signIn(email);
    final appBox = await ref.watch(appBoxProvider.future);
    final userBox = await ref.watch(userBoxProvider.future);
    appBox.put('isLogged', true);
    userBox.put('user', user);
    print(user.toString());
    print(appBox.get('isLogged'));
  }
}
