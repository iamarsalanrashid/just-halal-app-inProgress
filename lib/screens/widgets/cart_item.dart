import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/cartService.dart';
import 'package:halal_app/core/providers/foodService.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String cartItemId;
  final int cartItemQuantity;
  final String cartItemName;
  final double cartItemPrice;

  CartItem({required this.cartItemId,required this.cartItemName,required this.cartItemQuantity,
     required this.cartItemPrice});

  @override
  Widget build(BuildContext context) {
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
                child: Center(child: Text(cartItemQuantity.toString())),
              ),
              SizedBox(
                width: 12,
              ),
              Image.asset('assets/images/Rectangle 25.png'),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 90,
                child: Text(
                  cartItemName,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          Text(
            '${cartItemPrice*cartItemQuantity}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
