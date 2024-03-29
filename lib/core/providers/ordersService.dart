import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart.dart';
import '../models/order.dart';

class OrdersService with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  List<Order> _cancelledOrders = [];
  // List<Order> _cancelledOrders = items.where((element) =>element.orderStatus == 'Cancelled').toList();

  List<Order> get cancelledOrders {
    return [..._cancelledOrders];
  }

  List<Order> get completedOrders {
    return _items.where((element) => element.orderStatus == 'Completed')
        .toList();
  }

Future<void> addOrder(List<Cart> cartItems, double totalPrice) async {
  final url = Uri.parse(
      'https://just-halal-b48e6-default-rtdb.firebaseio.com/orders.json');
  final timestamp = DateTime.now();
  try {
    final response = await http.post(
      url,
      body: json.encode({
        'cartItems': cartItems
            .map((ci) =>
        {
          'id': ci.id,
          'price': ci.price,
          'title': ci.title,
          'quantity': ci.quantity
        })
            .toList(),
        'price': totalPrice,
        'timeStamp': timestamp.toIso8601String(),
        'orderStatus': 'Placed',
      }),
    );
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    _items.insert(
        0,
        Order(
            orderId: responseData['name'],
            cartItems: cartItems,
            price: totalPrice,
            timeStamp: timestamp,
            orderStatus: 'Placed'));
    print('this is added order item: _items[0].orderId');
    // notifyListeners();
  } catch (error) {
    print(error);
  }
}

Future<void> fetchandSetOrders() async {
  final url = Uri.parse(
      'https://just-halal-b48e6-default-rtdb.firebaseio.com/orders.json');
  try {
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<Order> loadedOrders = [];
    extractedData.forEach((orderId, orderItem) {
      loadedOrders.add(
        Order(
          orderId: orderId,
          cartItems: (orderItem['cartItems'] as List<dynamic>)
              .map(
                (ci) =>
                Cart(
                    id: ci['id'],
                    price: ci['price'],
                    title: ci['title'],
                    quantity: ci['quantity']),
          )
              .toList(),
          price: orderItem['price'],
          timeStamp: DateTime.parse(orderItem['timeStamp']),
        ),
      );
    });
    if (response.statusCode == 200) {
      print('order successfully fetched');
    }
    _items = loadedOrders;
    print(extractedData);
    print('the length of orderitems is ${_items.length}');
  } catch (error) {
    print('error in fetching order: $error');
  }
}

Future<void> cancelOrder(String orderId) async {
  final url = Uri.parse(
      'https://just-halal-b48e6-default-rtdb.firebaseio.com/orders/$orderId.json');
  final orderItem = _items.firstWhere((item) => item.orderId == orderId);
  final orderItemIndex = _items.indexWhere((item) => item.orderId == orderId);

  try {
    final response = http.patch(url,
        body: json.encode({
          'cartItems': orderItem.cartItems
              .map((ci) =>
          {
            'id': ci.id,
            'price': ci.price,
            'title': ci.title,
            'quantity': ci.quantity
          })
              .toList(),
          'price': orderItem.price,
          'timeStamp': orderItem.timeStamp.toIso8601String(),
          'orderStatus': 'Cancelled',
        }));
    var cancelledOrder = Order(
        orderId: orderItem.orderId,
        cartItems: orderItem.cartItems,
        price: orderItem.price,
        timeStamp: orderItem.timeStamp,
        orderStatus: 'Cancelled');
    _cancelledOrders.add(cancelledOrder);
    _items.removeAt(orderItemIndex);
    // notifyListeners();
    print(_items[orderItemIndex].orderStatus);
  } catch (error) {
    print(error);
  }
}


}
