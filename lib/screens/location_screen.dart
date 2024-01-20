import 'package:flutter/material.dart';
import 'package:halal_app/screens/new_address_screen.dart';

import '../app_color.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location-screen';

  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: width,
              height: height,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/location.png',
                    height: height * 0.75,
                    width: width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: height * 0.32,
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey,width: 1,)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),color: Colors.white,
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Use current location',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(NewAddressScreen.routeName);

                            },
                            child: Text(
                              'Enter New Address',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
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
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
