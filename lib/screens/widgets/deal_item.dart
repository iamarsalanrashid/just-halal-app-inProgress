import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/core/providers/cartService.dart';
import 'package:provider/provider.dart';

import '../../core/providers/foodService.dart';

class DealItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;

  DealItem(this.id, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<FoodService>(context).items;
    final cartData = Provider.of<CartService>(context);

    final foodItem = foodData.firstWhere((food) => id == food.id);
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            height: 225,
            width: 230,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                        'assets/images/home_images/Rectangle 17.png')),
                SizedBox(
                  height: 3,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '20 in Pizza,1 Dip Sauce & 345ml drink',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          cartData.addItem(
                              itemId: foodItem.id, itemPrice:foodItem.price, itemTitle: foodItem.name);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
