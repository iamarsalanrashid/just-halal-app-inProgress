import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';

class CustomShareButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
        },
        child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(
                child: Icon(
                  Icons.share,
                  color: AppColor.primary,
                ))));
  }
}
