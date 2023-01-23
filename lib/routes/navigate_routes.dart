
import 'package:foodigy/presentation/cart_screens.dart/cart_home_screen.dart';
import 'package:foodigy/presentation/init_screens/init_screen.dart';
import 'package:foodigy/presentation/on_boarding_screen/on_board_screen.dart';
import 'package:foodigy/presentation/static_screens/splash_screen.dart';
import 'package:get/get.dart';

//new type
// Get.toNamed(AppRoutes.mobileLoginScreen);

class AppRoutes {
  static const splashScreen = Routes.splashScreen;
  static const initScreen = Routes.initScreen;
  static const onboardScreen = Routes.onboardScreen;
   static const cartHomeScreen = Routes.cartHomeScreen;
 

  static final routes = [
    GetPage(
      name: Routes.splashScreen, page: () => SplashScreen(),
      // binding: AllRestaurantsBinding()
    ),
    GetPage(name: Routes.initScreen, page: () => InitializerWidget()),
    GetPage(name: Routes.onboardScreen, page: () => Onbording()),
     GetPage(name: Routes.cartHomeScreen, page: () => CartHomeScreen()),
   
  ];
}

class Routes {
  static const splashScreen = '/';
  static const initScreen = '/init';
  static const onboardScreen = '/onboard';
   static const cartHomeScreen = '/cartHomeScreen';
 
}
