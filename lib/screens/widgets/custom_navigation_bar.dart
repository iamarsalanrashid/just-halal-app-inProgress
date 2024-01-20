import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';

import '../home_screen.dart';
import '../orders_navigation_screen.dart';
import '../profile_screen.dart';

class CustomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
