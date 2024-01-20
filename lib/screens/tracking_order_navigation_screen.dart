import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/order_summary_widget.dart';
import 'package:halal_app/screens/widgets/orders_chat_widget.dart';
import 'package:halal_app/screens/widgets/tracking_order_screen_widget.dart';

class TrackingOrderNavigationScreen extends StatelessWidget {
  static const routeName = '/tracking-order-navigation-screen';

  const TrackingOrderNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.grey,
          title: Text(
            'Tracking Order',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
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

        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TabBar(
                indicatorColor: AppColor.primary,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Text(
                      'Tracking',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: height,
              child: TabBarView(children: [
                TrackingOrderScreenWidget(),
                OrderSummaryWidget(),
                OrderChatWidget(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
