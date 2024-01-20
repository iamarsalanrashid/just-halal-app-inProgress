import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';

import '../app_color.dart';

class DeliveryArrivedScreen extends StatefulWidget {
  static const routeName = '/delivery-arrived-screen';

  const DeliveryArrivedScreen({super.key});

  @override
  State<DeliveryArrivedScreen> createState() => _DeliveryArrivedScreenState();
}

class _DeliveryArrivedScreenState extends State<DeliveryArrivedScreen> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'Delivery Arrived',
          style: TextStyle(
            fontSize: 14,
            color: AppColor.primary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
          color: AppColor.primary,
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                16,
              ),
              topLeft: Radius.circular(
                16,
              )),
          border: Border(
              top: BorderSide(
                  color: Colors.grey,width: 3
              )),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.home_filled) , onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(incomingIndex: 0 ,
                  ),
                ),
              );
            }),
            IconButton(
              icon: Icon(Icons.library_books),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSwitcher(incomingIndex: 1,
                    ),
                  ),
                );

              },
            ),
            IconButton(icon: Icon(Icons.person), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(incomingIndex: 2,
                  ),
                ),
              );

            }),
          ],
        ),
      ),

      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        children: [
          Image.asset(
            'assets/images/delivery arrived.png',
            height: 200,
            width: width,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Rate your delivery',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColor.primary,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColor.primary,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColor.primary,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColor.primary,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                'What is your feedback?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 230,
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColor.border,
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Text(
                  'Add Reviews',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 9,
              ),

            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),],
      ),
    );
  }
}
