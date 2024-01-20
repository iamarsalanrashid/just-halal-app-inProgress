import 'order.dart';

class Notification {
  final String notificationId;
  final Order order;

  Notification({
    required this.notificationId,
    required this.order,
  });
}
