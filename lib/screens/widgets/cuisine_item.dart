import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/cuisines_screen.dart';

class CuisineItem extends StatelessWidget {
  const CuisineItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CuisinesScreen.routeName);
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.border,
          ),
          child: Image.asset(
            'assets/images/home_images/Rectangle 20 (1).png',
          ),
        ),
      ),
    );
  }
}
