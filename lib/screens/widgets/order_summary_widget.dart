import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';

class OrderSummaryWidget extends StatelessWidget {
  List<String> orderSummarytitles = [
    'Subtotal',
    'Delivery Fee',
    'Platform Fee',
    'Tax',
    'Delivery Time'
  ];
  List<String> orderSummaryValues = [
    '\$1.00',
    '\$1.00',
    '\$1.00',
    '\$1.00',
    '30 min'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      children: [
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Original Chicken Burger',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$1.00',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 5; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderSummarytitles[i],
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        orderSummaryValues[i],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              ],
            )),
        SizedBox(
          height: 12,
        ),
        // Container(
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 12,
        //       vertical: 16,
        //     ),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(14),
        //       ),
        //       border: Border.all(
        //         color: Colors.grey,
        //       ),
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Icon(
        //               Icons.thumb_up,
        //               color: AppColor.primary,
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   'Reviews',
        //                   style: TextStyle(
        //                     color: AppColor.primary,
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 6,
        //                 ),
        //                 Row(
        //                   children: [
        //                     Icon(
        //                       Icons.star,
        //                       color: AppColor.primary,
        //                     ),
        //                     Icon(
        //                       Icons.star,
        //                       color: AppColor.primary,
        //                     ),
        //                     Icon(
        //                       Icons.star,
        //                       color: AppColor.primary,
        //                     ),
        //                     Icon(
        //                       Icons.star,
        //                       color: AppColor.primary,
        //                     ),
        //                     Icon(
        //                       Icons.star,
        //                       color: Colors.grey,
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //         SizedBox(
        //           height: 6,
        //         ),
        //         Text(
        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed augue at est rutrum semper non feugiat turpis. Duis vitae urna faucibus, suscipit erat a, pharetra justo. Phasellus vel dolor ornare, lobortis nibh non, porta odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam posuere sapien vel enim congue interdum. Aenean sed sem odio. Fusce quis rhoncus nunc, a aliquam sapien.',
        //           style: TextStyle(
        //             fontSize: 10,
        //           ),
        //         ),
        //       ],
        //     )),
      ],
    );
  }
}
