import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/ordersService.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/restaurant_screen.dart';
import 'package:halal_app/screens/widgets/cart_item.dart';
import 'package:provider/provider.dart';

import '../core/models/cart.dart';
import '../core/providers/cartService.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isLoading = false;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {setState(() {
      _isLoading = true;
    });
    Provider.of<CartService>(context).fetchAndSetCartItems().then((_) {
      setState(() {
        _isLoading = false;
      });
    });}

    _isInit = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartService>(context, listen: true);
    final Map<String, Cart> cartItems =
        Provider.of<CartService>(context, listen: true).items;
    final orderData = Provider.of<OrdersService>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 70,
                  width: width,
                  child: Center(
                    child: Text('Add Journey (widget) here'),
                  ),
                ),
                Container(
                  height: 90,
                  width: width,
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 50, right: 16),
                  decoration: BoxDecoration(
                    color: AppColor.border,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Frame.png'),
                      SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Estimated Delivery',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Now(25 min)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    16,
                  ),
                  height: 230,
                  width: width,
                  child: cartItems.isEmpty
                      ? Center(
                          child: Text(
                            'No Items present in the cart!',
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => CartItem(
                            cartItemId: cartItems.keys.toList()[index],
                            cartItemQuantity:
                                cartItems.values.toList()[index].quantity,
                            cartItemName:
                                cartItems.values.toList()[index].title,
                            cartItemPrice:
                                cartItems.values.toList()[index].price,
                          ),
                          separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                          itemCount: cartData.items.length,
                        ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RestaurantScreen.routeName);
                        },
                        child: Text(
                          'Add More Items',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: FilledButton(
                    onPressed: () {
                      // orderData.addOrder(cartItems.values.toList(),cartData.totalPrice );
                      // orderData.fetchandSetOrders();
// cartData.MakeCartEmpty();
                      Navigator.of(context).pushNamed(CheckoutScreen.routeName);
                    },
                    child: Text(
                      'Confirm Payment and Address',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
    );
  }
}
