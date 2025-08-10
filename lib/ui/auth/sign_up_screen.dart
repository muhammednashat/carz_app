import 'package:carz_app/config/app_locale.dart';
import 'package:carz_app/config/dependeces.dart';
import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/ui/auth/social_account_button.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final List<TextEditingController> controllers = List.generate(
    4,
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
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: controllers[0],
                    decoration: InputDecoration(
                      hintText: AppLocale.name.getString(context),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: controllers[1],
                    decoration: InputDecoration(
                      hintText: AppLocale.emailAddress.getString(context),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: controllers[2],
                    decoration: InputDecoration(
                      hintText: AppLocale.passport.getString(context),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: controllers[3],
                    decoration: InputDecoration(
                      hintText: AppLocale.confirmPassword.getString(context),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 24.0),
                  CustomElevatedButton(
                    onPressed: onPressed,
                    text: AppLocale.signup.getString(context),
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
                      text: AppLocale.haveAccountLogin.getString(context),
                      children: [
                        TextSpan(
                          text: AppLocale.login.getString(context),
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

  onPressed() {
    if (_formKey.currentState!.validate()) {
      signUp();
    }
  }

  signUp() async {
    final name = controllers[0].text ;
    final email = controllers[1].text;
    final repo = ref.watch(authRepoProvider);
    final userModel =await repo.creatNewAccount(name, email);
    print(userModel.toString());
  }
}
