import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/cartService.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
final String itemId;
  CartItem(this.itemId);
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartService>(context).items;
    final cartItem = cartItems['itemId'];
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 36,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.border,
                    ),
                    borderRadius: BorderRadius.circular(
                      4,
                    )),
                child: Center(child: Text(cartItem.quantity.toString())),
              ),
              SizedBox(width: 12,),
              Image.asset('assets/images/Rectangle 25.png'),
              SizedBox(width: 12,),

              Container(
                width: 60,
                child: Text(
                  cartItem.name,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
          Text(
            '${cartItem.price}*${cartItem.quantity}',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
