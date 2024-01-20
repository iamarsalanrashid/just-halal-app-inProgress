import 'package:flutter/material.dart';
import 'package:halal_app/Constants/constants.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password-screen';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColor.primary,
            ),),
        elevation: 2,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Image.asset(
              height: 200, 'assets/images/ForgotPassword.png'),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)

              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Dont worry it occurs. Please enter the email address linked with your account.',
                style: TextStyle(fontSize: 14)
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: InputDecoration(
                fillColor: AppColor.border,
                filled: true,
                label: Text('Email'),
                hintText: 'Enter Your Email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColor.border,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.mail),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          customElevatedButton(context, 'Enter Email',OtpVerificationScreen.routeName),
        ],
      ),
    );
  }
}
