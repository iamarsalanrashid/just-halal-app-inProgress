
import 'food.dart';

enum OrderStatus { Received, Arrived, Placed, Delivered, Cancelled }

class Order {
  final String orderId;
  final List<Food> orderItems;
  final double price;
  final DateTime placedAt;
  OrderStatus status;

  Order(
    this.status, {
    required this.orderId,
    required this.orderItems,
    required this.price,
    required this.placedAt,
  });
}
