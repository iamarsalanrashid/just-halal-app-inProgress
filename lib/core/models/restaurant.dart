import 'package:halal_app/core/models/deal.dart';
import 'package:halal_app/core/models/review.dart';

class Restaurant {
  final String restaurantName;
  final String info;
  final String location;
  final String priceRange;
  final List<Deal> deals;
  final String timings;

  final Review review;

  Restaurant(
      {required this.restaurantName,
      required this.info,
      required this.location,
      required this.priceRange,
      required this.review,
      required this.deals,
      required this.timings});
}
