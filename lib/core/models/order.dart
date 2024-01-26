
import 'package:halal_app/core/models/cart.dart';

import 'food.dart';

enum OrderStatus { Received, Arrived, Placed, Delivered, Cancelled }

class Order {
  final String orderId;
  final List<Cart> cartItems;
  final double price;
   String orderStatus = 'Placed' ;
  final DateTime timeStamp;
  // OrderStatus status;

  Order(
    // this.status,
      {
    required this.orderId,
    required this.cartItems,
    required this.price,
         this.orderStatus ='Placed',
        required this.timeStamp,

      });
}
