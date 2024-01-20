import 'package:flutter/material.dart';
import 'package:halal_app/Constants/constants.dart';
import 'package:halal_app/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          //background image
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              height: screenHeight * 0.65,
              width: screenWidth,
              'assets/images/fast-food-pattern-perfect-for-package-design-fast-food-seamless-background-vector (1) 1.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Image.asset(
                  height: 270,
                  width: 270,
                  'assets/images/white-01 1.png',
                ),
              ),
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Just Halal',
                      style: TextStyle(fontSize: 36, fontFamily: 'SpicyRice'),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    customElevatedButton(context,'Get Started',LoginScreen.routeName),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
