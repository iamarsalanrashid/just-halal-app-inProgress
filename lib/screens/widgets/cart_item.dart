import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
                child: Center(child: Text('1')),
              ),
              SizedBox(width: 12,),
              Image.asset('assets/images/Rectangle 25.png'),
              SizedBox(width: 12,),

              Container(
                width: 60,
                child: Text(
                  'Original Chicken Burger',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
          Text(
            '+\$ 5.00',
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
