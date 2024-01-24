import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:halal_app/core/models/review.dart';

class ReviewService with ChangeNotifier {
  static List<Review> _items = [];

  List<Review> get items {
    return [..._items];
  }

  static Future<void> getReviews() async {
    final url = Uri.parse(
        'https://just-halal-b48e6-default-rtdb.firebaseio.com/reviews/cuisines/burgers.json');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      final List<Review> loadedItems = [];

      extractedData.forEach((key, value) {
        loadedItems.add(Review(
            item: key,
            customer: value['customer'],
            rating: value['rating'],
            reviewText: value['reviewText'],
            time: value['time']));
        print(value['rating']);
      });

      _items = loadedItems;
      print(_items[0].reviewText);
    } catch (error) {
      print(error);
    }

// _items = [];
  }

  void removeAllReviewItems() {
    _items = [];
  }


}
