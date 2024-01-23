import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:halal_app/core/providers/reviewService.dart';
import 'package:halal_app/screens/cart_screen.dart';
import 'package:halal_app/screens/info_screen.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/reviews_screen.dart';
import 'package:halal_app/screens/widgets/custom_navigation_bar.dart';
import 'package:halal_app/screens/widgets/restaurant_deal_item.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurant-screen';

  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  Widget build(BuildContext context) {
    final BurgersData = Provider.of<FoodService>(context);
    final ReviewData = Provider.of<ReviewService>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar:Container(height: 60,width: width,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColor.border,width: 2))),
            padding: const EdgeInsets.all(12.0),

            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);

              },
              child: Text(
                'Place Order',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

          ),

          body: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                height: 392,
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        height: 220,
                        width: width,
                        'assets/images/Cuisine 3.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16,
                        top: 30,
                        child: CircleAvatar(backgroundColor: Colors.white,
                          child: IconButton(color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 30,
                        child: CircleAvatar(backgroundColor: Colors.white,
                          child: IconButton(color: Colors.white,
                            onPressed: () {
                            },
                            icon: Icon(
                              Icons.share,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily Deli CO',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed(ReviewsScreen.routeName);
                                  },
                                child: Text(
                                  'See Reviews',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Restaurant | 0.6 km away | \$5 minimum',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(onTap: (){
                                Navigator.of(context).pushNamed(InfoScreen.routeName);
      
                              },
                                child: Text(
                                  'More Info',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.primary,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.3 ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '(5000+)',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            height: 40,
                            width: width,
                            child: TabBar.secondary(
                              indicatorWeight: 6,
                              indicatorSize: TabBarIndicatorSize.label,
                              dividerColor: Colors.white,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Deals',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Starters',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Burgers',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Sandwiches',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 4),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                height: 900,
                width: width,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Deals',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      height: 800,
                      width: width,
                      child: TabBarView(
                        children: [
                          RestaurantDealItem(),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/images/Meals page.png'),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/images/Meals page.png'),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child:
                                Image.asset('assets/images/OtpVerification.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
