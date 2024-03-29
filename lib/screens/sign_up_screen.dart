import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_app/core/models/userProfile.dart';
import 'package:halal_app/core/providers/auth.dart';
import 'package:halal_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_color.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  String? _emailAddress;
  String? _fullName;
  String? _phoneNumber;
  String? _password;

  void onSaved(BuildContext ctx) async {

    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();
    try {
      final authData =Provider.of<Auth>(context,listen: false);
      authData.authenticateUser(
              userEmail: _emailAddress!.trim(),
              password: _password!.trim(),
              isLogin: false,
      ctx: ctx)
          .then((_) async {
            final userId = FirebaseAuth.instance.currentUser!.uid;
            UserProfile newUser;
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Successfully signed Up'),backgroundColor: Colors.green,));

            await FirebaseFirestore.instance.collection('users').doc(userId).set(
                { 'userId': userId ,
                  'userName' : _fullName!.trim().toString(),
                  'email': _emailAddress!.trim().toString(),
                  'phoneNumber' : _phoneNumber!.trim(),
                  'address':'Not Known',
                  'paymentMethod': 'Paypal'});
            Provider.of<Auth>(context,listen: false).currentUser = UserProfile(userId: userId, userName:  _fullName!.trim().toString(), email: _emailAddress!.trim().toString(), phoneNumber: int.parse(_phoneNumber!.trim()), address: 'Paypal');
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          });


    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Center(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 14),
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Full Name';
                    }
                    if (value!.length <= 2) {
                      return 'Name should be atleast 2 digits';
                    }
                  },
                  onSaved: (newValue) {
                    _fullName = newValue;
                  },
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  obscureText: false,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                  },
                  onSaved: (newValue) {
                    _phoneNumber = newValue;
                  },
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
                SizedBox(
                    // height: 10,
                    ),
                Container(
                  margin: EdgeInsets.only(top: 14, bottom: 14),
                  child: ElevatedButton(
                    onPressed: ()  {

                      onSaved(context);

                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                ),
                SizedBox(
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
      ),
    );
  }
}
