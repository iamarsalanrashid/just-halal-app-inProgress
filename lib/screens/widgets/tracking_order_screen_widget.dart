import 'package:flutter/material.dart';
import 'package:halal_app/screens/chat_screen.dart';
import 'package:provider/provider.dart';

import '../../app_color.dart';
import '../../core/models/order.dart';
import '../../core/providers/ordersService.dart';

class TrackingOrderScreenWidget extends StatelessWidget {
  Order orderItem;
   TrackingOrderScreenWidget(this.orderItem);

  @override
  Widget build(BuildContext context) {


    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: 310,
          width: width,
          child: Image.asset(
            'assets/images/order map.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: 26,
          left: 18,
          right: 18,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
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
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant Address',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '546 Street, Phone Booth Town',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'London',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 330,
            width: width,
            padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(46),
                topRight: Radius.circular(46),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/rider.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Tracking Order',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Order# ${orderItem.orderId}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Estimated Time 10:30 min ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {                    Navigator.of(context).pushNamed(ChatScreen.routeName);
                          },
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: AppColor.primary,
                            child: Image.asset(
                              'assets/icons/message.png',
                              height: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'message',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: AppColor.primary,
                            child: Image.asset(
                              'assets/icons/call.png',
                              height: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Call Rider',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<OrdersService>(context,listen: false).cancelOrder(orderItem.orderId);
                    },
                    child: Text(
                      'Cancel Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.border,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
