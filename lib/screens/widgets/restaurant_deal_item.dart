import 'package:flutter/material.dart';

import '../../app_color.dart';

class RestaurantDealItem extends StatelessWidget {
  const RestaurantDealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  margin: EdgeInsets.symmetric(vertical: 20),

                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(alignment: Alignment.centerLeft,
                                  width: 150,
                                  child: Text(
                                    'Original Chicken Burger',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '4 Pieces of fried mozzarella cheese sticks, crispy on the outside and stretch',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$5.00',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset('assets/images/Rectangle 25.png')
                        ],
                      ),
                      Divider(),
                    ],
                  ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              margin: EdgeInsets.symmetric(vertical: 20),

              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(alignment: Alignment.centerLeft,
                              width: 150,
                              child: Text(
                                'Original Chicken Burger',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '4 Pieces of fried mozzarella cheese sticks, crispy on the outside and stretch',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '\$5.00',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/Rectangle 25.png')
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              margin: EdgeInsets.symmetric(vertical: 20),

              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(alignment: Alignment.centerLeft,
                              width: 150,
                              child: Text(
                                'Original Chicken Burger',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '4 Pieces of fried mozzarella cheese sticks, crispy on the outside and stretch',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '\$5.00',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/Rectangle 25.png')
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
