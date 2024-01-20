import 'package:flutter/material.dart';
import 'package:halal_app/app_color.dart';
import 'package:halal_app/screens/cart_screen.dart';
import 'package:halal_app/screens/page_switcher.dart';
import 'package:halal_app/screens/widgets/deal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = '/meal-screen';

  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int count = 0;

  Widget itemRow(String name) {
    bool? _isChecked = true;

    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            '+ \$1.00',
            style: TextStyle(
              fontSize: 12,
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
          children: [
            Stack(
              children: [Image.asset(
                'assets/images/Meals page.png',
                height: 200,
                width: width,
                fit: BoxFit.fill,
              ),Positioned(
                left: 16,
                top: 30,
                child: CircleAvatar(backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
               ]
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 16,
                right: 16,
                left: 16,
              ),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Original Chicken Burger',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'From \$5.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      'Five of our world-famous Chiken Burger topped with hot sauce',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.border,
              ),
              height: 220,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        child: Text(
                          'Frequently bought together',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Optional',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Other customers also order these',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  itemRow('Mint Margaritta'),
                  itemRow('Chiken Wings'),
                  itemRow('Drinks'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special Instructions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    child: Text(
                      'Please Let us know if you are allergic to anything of. If we need to avoid anything',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    padding: EdgeInsets.all(
                      10,
                    ),
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: Text(
                      'e.g. No Mayo',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 110,
                          // height: 80,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                      });
                                    } else {}
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.grey),
                                  child: Icon(
                                    Icons.horizontal_rule,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text('$count'),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primary),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {                    Navigator.of(context).pushNamed(CartScreen.routeName);
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
