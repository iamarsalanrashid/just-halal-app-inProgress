import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/auth.dart';
import 'package:halal_app/screens/otp_verification_screen.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password-screen';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  String? _emailAddress;

  Future<void> onSaved() async {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      await Provider.of<Auth>(context, listen: false)
          .whenForgotPassword(_emailAddress!.trim());
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error : $error'),
        backgroundColor: Colors.blue,),
      );
   return; }
  }

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
          ),
        ),
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            Image.asset(height: 200, 'assets/images/ForgotPassword.png'),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forgot Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                    'Dont worry it occurs. Please enter the email address linked with your account.',
                    style: TextStyle(fontSize: 14)),
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
              validator: (value) {
                if (value!.contains('@') || value.isEmpty) {
                  return 'Enter a valid email.';
                }
              },
              onSaved: (newValue) {
                _emailAddress = newValue;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 14, bottom: 14),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  onSaved().then((_) {
                    setState(() {
                      _isLoading = false;
                      Navigator.of(context)
                          .pushNamed(OtpVerificationScreen.routeName);
                    });
                  });
                },
                child: _isLoading? CircularProgressIndicator(color: Colors.white,) :   Text(
                  'Enter Email',
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

            // customElevatedButton(context, 'Enter Email',OtpVerificationScreen.routeName),
          ],
        ),
      ),
    );
  }
}
