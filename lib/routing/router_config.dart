import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/splash_screen.dart';
import 'package:carz_app/ui/auth/log_in_screen.dart';
import 'package:carz_app/ui/auth/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [

    
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
      ),
    


    // Auth navigation /lo/s
    GoRoute(
      path: Routes.loginScreen,
      builder: (context, state) => LoginScreen(),
      routes: [
        //push(/login/signup)
        GoRoute(
          path: Routes.signUpScreen, // signup 
          builder: (context, state) => SignUpScreen(),
        ),
      ],
    ),








  ],
);
