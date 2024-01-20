import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/cuisine_screen_item.dart';
import 'package:halal_app/screens/widgets/custom_navigation_bar.dart';

class CuisinesScreen extends StatefulWidget {
  static const routeName = '/cuisines-screen';

  const CuisinesScreen({super.key});

  @override
  State<CuisinesScreen> createState() => _CuisinesScreenState();
}

class _CuisinesScreenState extends State<CuisinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,shadowColor: Colors.grey,

          centerTitle: false,
          title: Text(
            'Burgers',
            style: TextStyle(
              color: AppColor.primary,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: AppColor.primary,
              )),
        ),
        bottomNavigationBar: Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              16,
            ),
            topLeft: Radius.circular(
              16,
            )),
        border: Border(
            top: BorderSide(
              color: Colors.black,
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: MediaQuery.of(context).size.height,
          child: CuisineScreenItem(),
        ));
  }
}
