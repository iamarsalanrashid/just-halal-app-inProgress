import 'package:flutter/material.dart';

class OrderChatWidget extends StatelessWidget {
  const OrderChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          height: 100,
          width: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(22),
              topLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey,Good Evening..! Can you please tell us where is your house, I have arrived near phone booth Thanks',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '4:15 PM',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          height: 100,
          width: 210,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(22),
              topLeft: Radius.circular(22),
              bottomLeft: Radius.circular(22),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey,Good Evening..! Can you please tell us where is your house, I have arrived near phone booth Thanks',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '4:15 PM',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          height: 100,
          width: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(22),
              topLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey,Good Evening..! Can you please tell us where is your house, I have arrived near phone booth Thanks',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '4:15 PM',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
