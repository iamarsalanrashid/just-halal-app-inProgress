import 'package:flutter/material.dart';
import 'package:halal_app/screens/chat_screen.dart';
import 'package:halal_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../app_color.dart';
import '../core/providers/auth.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Auth>(context).fetchUserProfile().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator(),)
          : ListView(
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
                        authData.currentUser!.userName,
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
                        authData.currentUser!.email,
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
                        authData.currentUser!.address,
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
                        'PayPal',
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
