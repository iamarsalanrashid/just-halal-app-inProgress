import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';

import '../app_color.dart';

class FiltersScreen extends StatelessWidget {

  static const routeName = '/filters-screen';
  final List<String> filters = [
    'Burgers',
    'Pizza',
    'Shawarma',
    'Chowmein',
    'IceCream',
    'Biryani',
    'Broast',
    'Bar BQ',
    'Pasta',
    'Desert'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColor.primary,
          ),),
        elevation: 2,),
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

      body: ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(16),
                child: Text(filters[index]),
              ),
          separatorBuilder: (context, _) {
            return Divider();
          },
          itemCount: filters.length),
    );
  }
}
