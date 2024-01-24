class Review {
  final String item;
  final String customer; //access only name here
  final double rating;
  final String time;
  final String reviewText;

  Review({
    required this.item,
    required this.customer,
    required this.rating,
    required this.reviewText,
    required this.time,
  });
}
