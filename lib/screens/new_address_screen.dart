import 'package:flutter/material.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/custom_navigation_bar.dart';

import '../app_color.dart';

class NewAddressScreen extends StatefulWidget {
  static const routeName = '/new-address-screen';

  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
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
                    'assets/images/location1.png',
                    height: height * 0.45,
                    width: width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: height * 0.72,
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 48,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: AppColor.border,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                  color: AppColor.primary,
                                ),
                              ),
                              Container(
                                width: width * 0.75,
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    label: Text('Enter New Address'),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColor.primary,
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.border),
                                    ),
                                    fillColor: AppColor.border,
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          Image.asset(
                            'assets/images/Enter New Address Diagram.png',
                            // height: height * 0.45,
                            // width: width,
                            // fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageSwitcher(incomingIndex: 0,
                                  ),
                                ),
                              ); },
                            child: Text(
                              'Done',
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
