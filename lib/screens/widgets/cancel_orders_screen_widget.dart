import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/orders_navigation_screen.dart';
import 'package:provider/provider.dart';

import '../../core/providers/ordersService.dart';
import '../processed_orders_navigation_screen.dart';

class CancelOrdersScreenWidget extends StatelessWidget {
  const CancelOrdersScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersService>(context);
    final cancelledOrders = orderData.cancelledOrders;
    return cancelledOrders.isEmpty ? Center(child: Text('No Cancelled Orders Yet!'),): ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 22,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProcessedOrdersNavigationScreen.routeName);

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
              CircleAvatar(
                backgroundColor: AppColor.primary,
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 38,
                ),
              ),
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
                        'Order No# ${cancelledOrders[index].orderId}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 94,
                      ),
                      Text(
                        '\$${cancelledOrders[index].price }',
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
      itemCount: cancelledOrders.length,
    );
  }
}
