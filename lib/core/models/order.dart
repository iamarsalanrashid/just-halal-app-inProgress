
import 'package:halal_app/core/models/cart.dart';

import 'food.dart';

enum OrderStatus { Received, Arrived, Placed, Delivered, Cancelled }

class Order {
  final String orderId;
  final List<Cart> orderItems;
  final double price;
  // OrderStatus status;

  Order(
    // this.status,
      {
    required this.orderId,
    required this.orderItems,
    required this.price,
  });
}
