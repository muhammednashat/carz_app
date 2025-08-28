import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/splash_screen.dart';
import 'package:carz_app/ui/address/confirm_address_screen.dart';
import 'package:carz_app/ui/all_brands/all_brands.dart';
import 'package:carz_app/ui/all_car/all_cars.dart';
import 'package:carz_app/ui/auth/log_in_screen.dart';
import 'package:carz_app/ui/auth/sign_up_screen.dart';
import 'package:carz_app/ui/car_details/car_details.dart';
import 'package:carz_app/ui/main/chooce_interest.dart';
import 'package:carz_app/ui/main/main_screen.dart';
import 'package:carz_app/ui/payment_method/add_new_card_screen.dart';
import 'package:carz_app/ui/payment_method/payment_method.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.chooseInterestScreen,
      builder: (context, state) => ChooceInterestScreen(),
    ),
     GoRoute(
      path: Routes.confirmAddressScreen,
      builder: (context, state) => ConfirmAddressScreen(),
    ), 
        GoRoute(
      path: Routes.addNewCard,
      builder: (context, state) => AddNewCardScreen(),
    ),  
     GoRoute(
      path: Routes.paymentMethodScreen,
      builder: (context, state) => PaymentMethodScreen(),
    ),  
    GoRoute(
      path: Routes.carDetailsScreen,

      builder: (context, state) {
        final car = state.extra as CarModel;
        return CarDetailsScreen(car: car);
      },
    ),
    GoRoute(
      path: Routes.allCarsScreen,
      builder: (context, state) { 
        final cars = state.extra as List<CarModel> ;
       return AllCarsScreen(cars: cars,);
        },
    ), 
    GoRoute(
      path: Routes.allBrandsScreen,
      builder: (context, state) => AllBrandsScreen(),
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

    //UserNavigation  //mainscreen
    GoRoute(
      path: Routes.mainScreen,
      builder: (context, state) => MainScreen(),
      routes: [

     ]
   ),
  ],
);
