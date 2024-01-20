import 'package:flutter/material.dart';
import 'package:halal_app/screens/chat_screen.dart';
import 'package:halal_app/screens/login_screen.dart';

import '../app_color.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 14,

            color: AppColor.primary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
          color: AppColor.primary,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Arslan Haider',
                  style: TextStyle(
                    fontSize: 12,

                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'dummyemail@gmail.com',
                  style: TextStyle(
                    fontSize: 12,

                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 12,

                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 12,

                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ChatScreen.routeName);

            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Help Center',
                style: TextStyle(
                  fontSize: 12,

                ),
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);

            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 12,

                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
