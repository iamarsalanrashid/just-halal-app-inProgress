import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/models/cart.dart';
import 'package:halal_app/core/providers/cartService.dart';
import 'package:halal_app/screens/location_screen.dart';
import 'package:halal_app/screens/payment_method_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout-screen';

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _switchOn = true;

  final List<String> orderFields = [
    'Original Chicken Burger',
    'Subtotal',
    'Delivery Fee',
    'Platform Fee',
    'Tax',
    'Delivery Time'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Cart> cartItems =
        Provider.of<CartService>(context).items.values.toList();
    final cartData = Provider.of<CartService>(context);
    final List orderPrice = [
      cartData.totalPrice.toString(),
      '\$1.00',
      '\$1.00',
      '\$1.00',
      '\$1.00',
      '30 min'
    ];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'Cart',
          style: TextStyle(
            color: AppColor.primary,
            fontSize: 12,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close_rounded,
            color: AppColor.primary,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColor.border, width: 2))),
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(PaymentMethodScreen.routeName);
          },
          child: Text(
            'Place Order',
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
      body: ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 70,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Journey.png'))),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Switch(
                  value: _switchOn,
                  onChanged: (value) {
                    setState(() {
                      _switchOn = value;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LocationScreen.routeName);
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LocationScreen.routeName);
            },
            child: Text(
              '123 Bakers Street, Maryleborne, NW1 6XE London',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Contact less delivery: your rider will place your order at your door.',
            style: TextStyle(fontSize: 12),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Text('Add instructions for your rider'),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wallet),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Payment Method',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(PaymentMethodScreen.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: AppColor.primary,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'MasterCard *****1234',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < cartItems.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cartItems[i].title} * ${cartItems[i].quantity}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '\$${cartItems[i].price * cartItems[i].quantity}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orderFields[index],style: TextStyle(
                        fontSize: 12,
                      ),),
                      Text(orderPrice[index],style: TextStyle(
                        fontSize: 12,
                      ),)
                    ],
                  ),
                  itemCount: orderFields.length,
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 12,
          // ),
        ],
      ),
    );
  }
}
