import 'package:flutter/material.dart';
import 'package:halal_app/screens/location_screen.dart';
import 'package:halal_app/screens/login_screen.dart';

import '../app_color.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16
            ),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 14),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Email'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  label: Text('Full Name'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Phone Number'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
      
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Password'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
              ),
              SizedBox(
                // height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 14, bottom: 14),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LocationScreen.routeName);
      
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 18,
                ),
                child: Text(
                  'Or Sign Up With',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 85,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Image.asset(
                      'assets/images/image 1.png',
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    height: 50,
                    width: 85,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Image.asset(
                      'assets/images/image 2.png',
                    ),
                  ),
                ],
              ),SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
