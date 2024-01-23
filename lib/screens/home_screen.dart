import 'package:flutter/material.dart';
import 'package:halal_app/screens/cart_screen.dart';
import 'package:halal_app/screens/filters_screen.dart';
import 'package:halal_app/screens/meal_screen.dart';
import 'package:halal_app/screens/notifications_screen.dart';
import 'package:halal_app/screens/widgets/cuisine_item.dart';
import 'package:halal_app/screens/widgets/deal_item.dart';

import '../app_color.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 40,
                bottom: 25,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(NotificationsScreen.routeName);
                          },
                          child: Container(
                            child: Image.asset(
                                'assets/images/home_images/Group 52.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 3,
                          ),
                          width: 230,
                          child: Text(
                            '123 Baker Street, Marylebone, NW1 6XE London',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(CartScreen.routeName);
                          },
                          child: Container(
                            child: Image.asset(
                                'assets/images/home_images/Group 53.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    height: 40,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 270,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Search Restaurants and cusines',
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.primary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.border,
                                ),
                              ),
                              fillColor: AppColor.border,
                              filled: true,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(FiltersScreen.routeName);
                          },
                          child: Image.asset(
                              'assets/images/home_images/Group 59.png',
                              width: 65),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  height: 165,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 135,
                      top: 30,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Special deal for mothers day',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MealScreen.routeName);
                          },
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -25,
                  child: Image.asset('assets/images/home_images/pngwing 1.png'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Your Daily Deals',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              width: width,
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MealScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 16,
                    ),
                    height: 220,
                    width: 160,
                    child: DealItem(),
                  ),
                ),
                itemCount: 4,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Cuisines',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
                left: 16,
                bottom: 16,
              ),
              width: width,
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CuisineItem(),
                itemCount: 7,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
                left: 16,
                bottom: 16,
              ),
              width: width,
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CuisineItem(),
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
