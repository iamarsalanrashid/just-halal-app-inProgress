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
      {required String itemId,
      required double itemPrice,
      required String itemTitle}) async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/cart/$itemId.json');
    final timestamp = DateTime.now().toIso8601String();
    try {
      if (_items.containsKey(itemId)) {
        _items.update(itemId, (existingItem) {
          return Cart(
              id: timestamp,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1);
        });
        final updateCartResponse = http.patch(
          url,
          body: json.encode({
            'id': timestamp,
            'price': itemPrice,
            'title': itemTitle,
            'quantity': _items[itemId].quantity
          }),
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
        final response = http.patch(
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
    print(_items.values.toList()[0].quantity.toString());
    print(timestamp);
  }

  Future<void> fetchAndSetCartItems() async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/cart.json');
    try {
      final response = await http.get(url);
      final extractedCartProducts =
          json.decode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic> loadedCartProducts = {};
      extractedCartProducts.forEach((foodId, cartFoodValues) {
        loadedCartProducts[foodId] = Cart(
            id: cartFoodValues['id'],
            price: cartFoodValues['price'],
            title: cartFoodValues['title'],
            quantity: cartFoodValues['quantity']);
      });

      _items = loadedCartProducts;

      print(
          ' this is the list of cartitems in memmory ${loadedCartProducts.keys.toList()}');
    } catch (error) {
      print(error);
    }
  }

  int get itemsCount {
    return _items.length;
  }
}
