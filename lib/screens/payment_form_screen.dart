import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/cartService.dart';
import 'package:halal_app/screens/tracking_order_navigation_screen.dart';
import 'package:provider/provider.dart';

import '../core/models/cart.dart';
import '../core/providers/ordersService.dart';

class PaymentFormScreen extends StatefulWidget {
  static const routeName = '/payment-form-screen';

  const PaymentFormScreen({super.key});

  @override
  State<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends State<PaymentFormScreen> {

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersService>(context);
    final cartData = Provider.of<CartService>(context);
    final cartItems = cartData.items;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,shadowColor: Colors.grey,

        title: Text(
          'Payment Method',
          style: TextStyle(
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
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        children: [
          Form(
            child: Column(
              children: [
                Image.asset(height: 70, 'assets/images/Journey (1).png'),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Card Number'),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.primary,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.border),
                    ),
                    fillColor: AppColor.border,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.primary,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.border),
                    ),
                    fillColor: AppColor.border,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Expiry Date: MM/YY'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.primary,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.border),
                          ),
                          fillColor: AppColor.border,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Card Number'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.primary,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.border),
                          ),
                          fillColor: AppColor.border,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Save Card Information',
                      style: TextStyle(fontSize: 10, color: AppColor.primary),
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          orderData.addOrder(cartItems.values.toList() as List<Cart>, cartData.totalPrice);
                          orderData.fetchandSetOrders();
                          // cartData.MakeCartEmpty();
                          Navigator.of(context).pushNamed(TrackingOrderNavigationScreen.routeName);
                        },
                        child: Text(
                          'Pay Now',
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
