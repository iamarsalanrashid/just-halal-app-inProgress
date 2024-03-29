import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/food.dart';

class FoodService with ChangeNotifier {
  List<Food> _items = [];

  List<Food> get items {
    return [..._items];
  }

  Future<void> getMeals() async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/foodItems/burgers.json');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      final List<Food> loadedItems = [];
      extractedData.forEach((key, value) {
        loadedItems.add(Food(
            id: value['id'],
            name: value['name'],
            imageUrl: value['imageUrl'],
            price: value['price'],
            description: value['description']));
      });
      _items = loadedItems;
    notifyListeners();} catch (error) {
      print(error);
    }
  }
}
