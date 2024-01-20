enum PaymentMethod { Paypal, MasterCard, VisaCard }

class UserProfile {
  final String userId;
  final String userName;
  final String email;
  final String address;
  PaymentMethod paymentMethod;

  UserProfile(
     {
    required this.userId,
    required this.userName,
    required this.email,
    required this.address,
       this.paymentMethod= PaymentMethod.Paypal,});
}
