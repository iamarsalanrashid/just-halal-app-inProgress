import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:halal_app/core/providers/reviewService.dart';
import 'package:halal_app/screens/restaurant_screen.dart';
import 'package:provider/provider.dart';

class CuisineScreenItem extends StatelessWidget {
  const CuisineScreenItem({super.key});

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<FoodService>(context).items;
    final ReviewData = Provider.of<ReviewService>(context).items;

    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){Navigator.of(context).pushNamed(RestaurantScreen.routeName);},
                child: Container(
                  width: double.infinity,
                  height: 270,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColor.border)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: Image.asset('assets/images/Cuisine 1.png'),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foodData[0].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${ReviewData[0].rating}',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$\$ -Fast Food, Fine Dining',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '35 min',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(
                                '\$ 1.00',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.of(context).pushNamed(RestaurantScreen.routeName);},

                child: Container(
                  width: double.infinity,
                  height: 270,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColor.border)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: Image.asset('assets/images/Cuisine 2.png'),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foodData[1].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${ReviewData[1].rating}',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$\$ -Pasta, Fine Dining',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '35 min',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(
                                '\$ 1.00',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.of(context).pushNamed(RestaurantScreen.routeName);},

                child: Container(
                  width: double.infinity,
                  height: 270,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColor.border)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: Image.asset('assets/images/Cuisine 3.png'),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foodData[2].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${ReviewData[2].rating}',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$\$ -Fast Food, Fine Dining',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '35 min',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(
                                '\$ 1.00',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
