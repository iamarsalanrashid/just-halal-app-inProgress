import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';

class CustomBackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(
                child: Icon(
              Icons.arrow_back_outlined,
              color: AppColor.primary,
            ))));
  }
}
