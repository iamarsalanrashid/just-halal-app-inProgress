import 'package:flutter/material.dart';
import 'package:halal_app/screens/login_screen.dart';

ElevatedButton customElevatedButton(BuildContext context, String text,String route,
    {double width = 300, double height = 55}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        primary: Theme.of(context).primaryColor),
    onPressed: () {
      Navigator.of(context).pushNamed(route);
    },
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
