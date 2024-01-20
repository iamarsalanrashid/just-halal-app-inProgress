import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/create_new_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const routeName = '/otp-verification-screen';

  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                height: 260,
                margin: EdgeInsets.only(top: 18, bottom: 18),
                child: Image.asset('assets/images/OtpVerification.png',fit: BoxFit.contain,),
              ),
              Text(
                'Forgot Password',
style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),              ),
              Container(margin: EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  'Dont worry it occurs. Please enter the email address linked with your account.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CreateNewPasswordScreen.routeName);
      
                },
                child: Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 33,vertical: 10),
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didnt Received the code'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Resend'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
