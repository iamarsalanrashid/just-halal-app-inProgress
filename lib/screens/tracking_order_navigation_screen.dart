import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/ordersService.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/order_summary_widget.dart';
import 'package:halal_app/screens/widgets/orders_chat_widget.dart';
import 'package:halal_app/screens/widgets/tracking_order_screen_widget.dart';
import 'package:provider/provider.dart';

class TrackingOrderNavigationScreen extends StatefulWidget {
  static const routeName = '/tracking-order-navigation-screen';

  const TrackingOrderNavigationScreen({super.key});

  @override
  State<TrackingOrderNavigationScreen> createState() =>
      _TrackingOrderNavigationScreenState();
}

class _TrackingOrderNavigationScreenState
    extends State<TrackingOrderNavigationScreen> {
  bool _isInit = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (!_isInit)
      setState(() {
        _isLoading = true;
      });
    Provider.of<OrdersService>(context).fetchandSetOrders().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    _isInit = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as String;
    final orderItem = Provider.of<OrdersService>(context)
        .items
        .firstWhere((item) => item.orderId == orderId);
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
            border: Border(top: BorderSide(color: Colors.grey, width: 3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.home_filled),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(
                          incomingIndex: 0,
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
                      builder: (context) => PageSwitcher(
                        incomingIndex: 1,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(
                          incomingIndex: 2,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
          onRefresh: () => Provider.of<OrdersService>(context).fetchandSetOrders(),
              child: ListView(
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
                        TrackingOrderScreenWidget(orderItem),
                        OrderSummaryWidget(orderItem),
                        OrderChatWidget(),
                      ]),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
