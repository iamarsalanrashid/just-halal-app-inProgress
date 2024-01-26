import 'package:flutter/material.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:halal_app/core/providers/ordersService.dart';
import 'package:halal_app/screens/tracking_order_navigation_screen.dart';
import 'package:provider/provider.dart';

import '../../app_color.dart';
import '../processed_orders_navigation_screen.dart';

class ActiveOrdersScreenWidget extends StatefulWidget {
  const ActiveOrdersScreenWidget({super.key});

  @override
  State<ActiveOrdersScreenWidget> createState() =>
      _ActiveOrdersScreenWidgetState();
}

class _ActiveOrdersScreenWidgetState extends State<ActiveOrdersScreenWidget> {
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    _isLoading = true;
    Provider.of<OrdersService>(context).fetchandSetOrders().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    // TODO: implement initState
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersService>(context);
    final orderitems = Provider.of<OrdersService>(context).items;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : orderitems.isEmpty
            ? Center(
                child: Text('No orders Yet'),
              )
            : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 22,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TrackingOrderNavigationScreen.routeName,arguments: orderitems[index].orderId);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 16,
                    ),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/icons/rider.png'),
                        SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${orderitems[index].orderId}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  '\$${orderitems[index].price}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Estimated Time: 10 min',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Original chicken Burger + mint marga..',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: 3,
              );
  }
}
