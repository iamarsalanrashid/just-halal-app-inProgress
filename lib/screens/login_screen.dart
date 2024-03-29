import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halal_app/screens/forgot_password_screen.dart';
import 'package:halal_app/screens/location_screen.dart';
import 'package:halal_app/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../app_color.dart';
import '../core/providers/auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  //  LoginScreen(this.submitFn);
  //
  // void Function(String userEmail, String userPassword,bool isLogin) submitFn;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _emailAddress;
  String? _password;
  bool _isLogin = true;



  Future<void> onSaved(BuildContext ctx) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {

      Provider.of<Auth>(context, listen: false)
          .authenticateUser(
          userEmail: _emailAddress!.trim(),
          password: _password!.trim(),
          isLogin: true,ctx : ctx).then((_){
        Provider.of<Auth>(context, listen: false)
            .fetchUserProfile();ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Successfully Logged In'),backgroundColor: Colors.green,));
          Navigator.of(context).pushNamed(LocationScreen.routeName);});
    } catch (error) {
      print('A general error from login screen: $error');
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(
          error.toString(),
        ),
        backgroundColor: Colors.cyan,
      ));

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
              //upper image
              SizedBox(
                height: 14,
              ),
              Image.asset(
                'assets/images/Frame.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 16),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              TextFormField(
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  label: Text('Email'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
                validator: (value) {
                  if (!value!.contains('@') || value!.isEmpty) {
                    return 'Please enter a valid Email';
                  }
                },
                onSaved: (newValue) {
                  _emailAddress = newValue;
                },
              ),
              SizedBox(
                height: 16,
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border),
                  ),
                  fillColor: AppColor.border,
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password field cannot be empty';
                  } else if (value.length <= 6) {
                    return ' The password should be atleast 6 characters long';
                  }
                },
                onSaved: (newValue) {
                  _password = newValue;
                },
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )),
                alignment: Alignment.centerRight,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  onSaved(context).then((value) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 16),
                child: Text(
                  'Or Login With',
                  style: TextStyle(fontSize: 12),
                ),
                alignment: Alignment.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    height: 40,
                    width: 70,
                    child: Image.asset(
                      'assets/images/image 1.png',
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    height: 40,
                    width: 70,
                    child: Image.asset(
                      'assets/images/image 2.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                    child: Text(
                      'Sign Up',
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
