import 'package:flutter/material.dart';

class OtpVerification2Screen extends StatelessWidget {
  static const routeName = '/otp-verification-screen-2';

  const OtpVerification2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 260,
            width: 260,
            child: Image.asset(
              'assets/images/ForgotPassword.png',
            fit: BoxFit.contain,),
      
          ),
        ),
      ),
    );
  }
}
