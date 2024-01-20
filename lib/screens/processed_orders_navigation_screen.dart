import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/order_summary_widget.dart';
import 'package:halal_app/screens/widgets/orders_chat_widget.dart';

import '../app_color.dart';

class ProcessedOrdersNavigationScreen extends StatelessWidget {
  static const routeName = '/processed-orders-screen';

  ProcessedOrdersNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    void navigatorFunction(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageSwitcher(incomingIndex: 1,
          ),
        ),
      );
    }

    void onItemTapped(int index) {
      currentPageIndex = index;
      navigatorFunction(context);
    }

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
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
            ),
          ),
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
                      'Orders Summary',
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
            SizedBox(
              height: 8,
            ),
            Divider(),
            Container(
              height: height,
              width: width,
              child: TabBarView(
                  children: [OrderSummaryWidget(), OrderChatWidget()]),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
