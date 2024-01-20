import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/payment_form_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  static const routeName = '/payment-method-screen';

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedMethod = 'PayPal';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,shadowColor: Colors.grey,

        title: Text('Payment Method',style: TextStyle(color: AppColor.primary,fontSize: 14),),

        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColor.primary,
          ),),),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset(height: 70, 'assets/images/Journey (1).png'),
          RadioListTile(
            title: Text('Paypal'),
            value: 'Paypal',
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: Image.asset(width: 42 ,'assets/images/Rectangle 46.png'),
          ),
          RadioListTile(
            title: Text('MasterCard'),
            value: 'MasterCard',
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: Image.asset(
              'assets/images/Rectangle 46 (1).png',
            ),
          ),
          RadioListTile(
            title: Text('Visa Card'),
            value: 'Visa Card',
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: Image.asset(
              'assets/images/Rectangle 46 (2).png',
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {                    Navigator.of(context).pushNamed(PaymentFormScreen.routeName);
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
