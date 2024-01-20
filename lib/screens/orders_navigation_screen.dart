import 'package:flutter/material.dart';
import 'package:halal_app/screens/forgot_password_screen.dart';
import 'package:halal_app/screens/widgets/active_orders_screen_widget.dart';
import 'package:halal_app/screens/widgets/cancel_orders_screen_widget.dart';
import 'package:halal_app/screens/widgets/completed_orders_screen_widget.dart';

import '../app_color.dart';

class OrdersNavigationScreen extends StatefulWidget {
  static const routeName = '/orders-navigation-screen';

  const OrdersNavigationScreen({super.key});

  @override
  State<OrdersNavigationScreen> createState() => _OrdersNavigationScreenState();
}

class _OrdersNavigationScreenState extends State<OrdersNavigationScreen> {


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.grey,
          title: Text(
            'Orders',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
            ),),
        ),

      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TabBar(
              indicatorColor: AppColor.primary,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              dividerColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'Active Orders',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed Orders',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Cancel Orders',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.primary,
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 8,
          ),
          Divider(),
          Container(
            height: height,
            width: width,
            child: TabBarView(children: [ ActiveOrdersScreenWidget(),
              CompletedOrdersScreenWidget(), CancelOrdersScreenWidget(),
            ])
            ,
          ),
        ],
      ),
    )
    ,
    );
  }
}
