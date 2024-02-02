enum PaymentMethod { Paypal, MasterCard, VisaCard }

class UserProfile {
  final String userId;
  final String userName;
  final String email;
  final int phoneNumber;
  final String address;
  final String  paymentMethod;

  UserProfile({
    required this.userId,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.paymentMethod = 'Paypal',
  });
}
