import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';

class DealItem extends StatelessWidget {
  const DealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            height: 195,
            width: 150,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                        'assets/images/home_images/Rectangle 17.png')),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Deal 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '20 in Pizza,1 Dip Sauce & 345ml drink',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$12.50',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container( alignment: Alignment.center,
                      padding: EdgeInsets.all(3),
                      height: 20,
                      width: 20,
                      child:
                        Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: AppColor.primary,

                    )
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
