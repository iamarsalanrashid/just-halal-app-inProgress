import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/location_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static const routeName = '/create-new-password-screen';

  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {

  final _key = GlobalKey<FormState>();
  String? _password;

  void onSaved ( ) {
    final isValid =  _key.currentState!.validate();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 18),
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/images/Reset Password Diagra.png',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                },),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Confirm Password'),
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
                  if (value != _password) {
                    return 'This Password doesnot matches the password you entered above';
                  }
                },
                onSaved: (newValue) {
                }, ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LocationScreen.routeName);
      
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
