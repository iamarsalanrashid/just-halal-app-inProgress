import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart.dart';
import '../models/order.dart';

class OrdersService with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get orderItems {
    return [..._items];
  }

  Future<void> addOrders(List<Cart> orderItems, double price) async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/orders.json');
    final timestamp = DateTime.now().toIso8601String();
    try {
      final response = await http.patch(url,
          body: json.encode({
            'orderId': timestamp,
            'orderItems': orderItems
                .map((ci) => Cart(
                    id: ci.id,
                    price: ci.price,
                    title: ci.title,
                    quantity: ci.quantity))
                .toList(),
            'price': price,
          }));

      _items.add(Order(orderId: timestamp, orderItems: orderItems, price: price));
    } catch (error) {
      print(error);
    }
  }
}

Future<void> getOrders() async {
  final url = Uri.parse(
      'https://just-halal-b48e6-default-rtdb.firebaseio.com/orders.json');

  try {} catch (error) {
    print(error);
  }
}
