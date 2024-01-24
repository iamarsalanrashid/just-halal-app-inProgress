import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:halal_app/core/models/cart.dart';

class CartService with ChangeNotifier {
  Map<String, dynamic> _items = {};

  Map<String, dynamic> get items {
    return {..._items};
  }

  Future<void> addItem(
      String itemId, double itemPrice, String itemTitle) async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/cart.json');
    final timestamp = DateTime.now().toString();
    try {
      if (_items.containsKey(itemId)) {
        final updateCartUrl = Uri.parse(
            'https://just-halal-b48e6-default-rtdb.firebaseio.com/cart/$itemId.json');

        _items.update(itemId, (existingItem) {
          Cart(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1);
        });

        final updateCartResponse = http.patch(
          updateCartUrl,
          body: json.encode({'quantity': _items[itemId].quantity}),
        );
      } else {
        _items.putIfAbsent(
          itemId,
          () => Cart(
            id: timestamp,
            price: itemPrice as double,
            title: itemTitle,
            quantity: 1,
          ),
        );
        final response = http.post(
          url,
          body: json.encode({
            'id': timestamp,
            'price': itemPrice,
            'title': itemTitle,
            'quantity': 1,
          }),
        );
        print(response);
      }
    } catch (error) {
      print(error);
    }
    print(_items.length);
  }

  int get itemsCount {
    return _items.length;
  }
}
