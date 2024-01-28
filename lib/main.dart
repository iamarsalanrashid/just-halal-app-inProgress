import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:halal_app/core/providers/ordersService.dart';
import 'package:halal_app/screens/cart_screen.dart';
import 'package:halal_app/screens/chat_screen.dart';
import 'package:halal_app/screens/checkout_screen.dart';
import 'package:halal_app/screens/create_new_password_screen.dart';
import 'package:halal_app/screens/cuisines_screen.dart';
import 'package:halal_app/screens/delivery_arrived_screen.dart';
import 'package:halal_app/screens/delivery_arrived_screen_2.dart';
import 'package:halal_app/screens/filters_screen.dart';
import 'package:halal_app/screens/forgot_password_screen.dart';
import 'package:halal_app/screens/help_center_screen.dart';
import 'package:halal_app/screens/home_screen.dart';
import 'package:halal_app/screens/info_screen.dart';
import 'package:halal_app/screens/location_screen.dart';
import 'package:halal_app/screens/meal_screen.dart';
import 'package:halal_app/screens/new_address_screen.dart';
import 'package:halal_app/screens/notifications_screen.dart';
import 'package:halal_app/screens/orders_navigation_screen.dart';
import 'package:halal_app/screens/otp_verification_2_screen.dart';
import 'package:halal_app/screens/otp_verification_screen.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/payment_form_screen.dart';
import 'package:halal_app/screens/payment_method_screen.dart';
import 'package:halal_app/screens/profile_screen.dart';
import 'package:halal_app/screens/restaurant_screen.dart';
import 'package:halal_app/screens/reviews_screen.dart';
import 'package:halal_app/screens/sign_up_screen.dart';
import 'package:halal_app/screens/splash_screen.dart';
import 'package:halal_app/screens/tracking_order_navigation_screen.dart';
import 'package:provider/provider.dart';

import 'app_color.dart';
import 'core/providers/cartService.dart';
import 'core/providers/reviewService.dart';
import 'firebase_options.dart';

// ...

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.primary,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FoodService()),
        ChangeNotifierProvider.value(value: ReviewService()),
        ChangeNotifierProvider.value(value: CartService()),
        ChangeNotifierProvider.value(value: OrdersService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
          ),
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(5, 104, 57, 1),
          ),
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                fontSize: 14,
              )),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          TrackingOrderNavigationScreen.routeName: (ctx) =>
              TrackingOrderNavigationScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          ReviewsScreen.routeName: (ctx) => ReviewsScreen(),
          RestaurantScreen.routeName: (ctx) => RestaurantScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          // ProcessedOrdersNavigationScreen.routeName: (ctx) =>ProcessedOrdersNavigationScreen(),
          PaymentMethodScreen.routeName: (ctx) => PaymentMethodScreen(),
          PaymentFormScreen.routeName: (ctx) => PaymentFormScreen(),
          OtpVerificationScreen.routeName: (ctx) => OtpVerificationScreen(),
          OtpVerification2Screen.routeName: (ctx) => OtpVerification2Screen(),
          OrdersNavigationScreen.routeName: (ctx) => OrdersNavigationScreen(),
          NotificationsScreen.routeName: (ctx) => NotificationsScreen(),
          NewAddressScreen.routeName: (ctx) => NewAddressScreen(),
          MealScreen.routeName: (ctx) => MealScreen(),
          // LoginScreen.routeName: (ctx) => LoginScreen(),
          LocationScreen.routeName: (ctx) => LocationScreen(),
          InfoScreen.routeName: (ctx) => InfoScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          HelpCenterScreen.routeName: (ctx) => HelpCenterScreen(),
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          DeliveryArrivedScreen.routeName: (ctx) => DeliveryArrivedScreen(),
          DeliveryArrivedScreen2.routeName: (ctx) => DeliveryArrivedScreen2(),
          CuisinesScreen.routeName: (ctx) => CuisinesScreen(),
          CreateNewPasswordScreen.routeName: (ctx) => CreateNewPasswordScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          PageSwitcher.routeName: (ctx) => PageSwitcher(incomingIndex: 0),
          ChatScreen.routeName: (ctx) => ChatScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
        },
      ),
    );
  }
}
