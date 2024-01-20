import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/home_screen.dart';
import 'package:halal_app/screens/orders_navigation_screen.dart';
import 'package:halal_app/screens/profile_screen.dart';

class PageSwitcher extends StatefulWidget {
  static const routeName = '/page-switcher';
  int incomingIndex = 0;

  PageSwitcher({required this.incomingIndex});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Colors.grey,width: 3,
          )),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon:  widget.incomingIndex !=0 ? Icon(Icons.home_filled) : Container(padding : EdgeInsets.symmetric(vertical: 4,horizontal: 12),decoration: BoxDecoration(borderRadius: BorderRadius.circular(6,),color: AppColor.primary,),child: Icon(Icons.home_filled,color: Colors.white,)),
                onPressed: () {
                  setState(() {
                    widget.incomingIndex = 0;
                  });
                  // Navigator.of(context).pushNamed(HomeScreen.routeName);
                }),
            IconButton(
              icon: widget.incomingIndex !=1 ? Icon(Icons.library_books) : Container(padding : EdgeInsets.symmetric(vertical: 4,horizontal: 12),decoration: BoxDecoration(borderRadius: BorderRadius.circular(6,),color: AppColor.primary,),child: Icon(Icons.library_books,color: Colors.white,)),
    onPressed: () {
      setState(() {
        widget.incomingIndex = 1;
      });
    }
            ),
            IconButton(icon:  widget.incomingIndex !=2 ? Icon(Icons.person) : Container(padding : EdgeInsets.symmetric(vertical: 4,horizontal: 12),decoration: BoxDecoration(borderRadius: BorderRadius.circular(6,),color: AppColor.primary,),child: Icon(Icons.person,color: Colors.white,)),
    onPressed: () {
    setState(() {
    widget.incomingIndex = 2;
    });}),
          ],
        ),
      ),
      body:
        [HomeScreen(),
      OrdersNavigationScreen(),
      ProfileScreen()][widget.incomingIndex]

    );
  }
}
