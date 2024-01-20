import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';

import '../app_color.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notification-screen';

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.of(context).pop();},
         icon : Icon(Icons.arrow_back_outlined),
          color: AppColor.primary,
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                16,
              ),
              topLeft: Radius.circular(
                16,
              )),
          border: Border(
              top: BorderSide(
                  color: Colors.grey,width: 3
              )),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.home_filled) , onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(incomingIndex: 0 ,
                  ),
                ),
              );
            }),
            IconButton(
              icon: Icon(Icons.library_books),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSwitcher(incomingIndex: 1,
                    ),
                  ),
                );

              },
            ),
            IconButton(icon: Icon(Icons.person), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(incomingIndex: 2,
                  ),
                ),
              );

            }),
          ],
        ),
      ),

      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16,),
        children: [

          Container(margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Your Order# 12345678 has arrived',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Text(
            'Your Order# 12345678 has arrived',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Divider(),
          Text(
            'Your Order# 12345678 has been canceled',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Divider(),
          Text(
            'Your Order# 12345678 is placed',
            style: TextStyle(
              fontSize: 12,
            ),
          ),          Divider(),

        ],
      ),
    );
  }
}
