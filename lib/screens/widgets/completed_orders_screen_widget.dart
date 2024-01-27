import 'package:flutter/material.dart';
import 'package:halal_app/screens/orders_navigation_screen.dart';
import 'package:halal_app/screens/processed_orders_navigation_screen.dart';

import '../../app_color.dart';
import '../../core/models/order.dart';

class CompletedOrdersScreenWidget extends StatelessWidget {

  // Order orderItem;
  // CompletedOrdersScreenWidget(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 22,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) =>
          //         ProcessedOrdersNavigationScreen()));
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
                  Icons.check_rounded,
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
                        'Order No# 12345678',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 94,
                      ),
                      Text(
                        '\$7.00 ',
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
