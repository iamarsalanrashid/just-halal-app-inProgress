import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:halal_app/app_color.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as chart;
import 'package:halal_app/screens/page_switcher.dart';

class ReviewsScreen extends StatefulWidget {
  static const routeName = '/reviews-screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  var selectedFilter = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,shadowColor: Colors.grey,
        title: Text(
          'Reviews',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColor.primary,
          ),),
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
        padding: EdgeInsets.all(16),
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(left: 28),
            // padding: EdgeInsets.only(left: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 5; i >= 1; i--)
                    Row(
                      children: [
                        // Left side - Filled star,color:AppColor.primarys and numbers
                        Row(
                          children: [
                            SizedBox(width: 6, child: Text('$i')),
                            SizedBox(width: 8.0),
                            Icon(Icons.star, color: AppColor.primary),
                          ],
                        ),
                        SizedBox(width: 8.0),
                        // Bar chart
                        Container(
                          width: 200.0,
                          // Adjust the width based on your needs
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            value: i * 0.2, // Adjust the percentage value
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColor.primary),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // Right side - Percentages
                        Text('${i * 20}%'),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Review',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.primary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 28,
            child: Wrap(
              spacing: 4,
              // runSpacing: 12,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                    showMenu(
                      context: context,
                      position: RelativeRect.fromRect(
                        Rect.fromPoints(Offset.zero, overlay.localToGlobal(overlay.size.bottomRight(Offset.zero))),
                        Offset.zero & overlay.size,
                      ),
                      items: [
                        PopupMenuItem(
                          child: Text('Newest'),
                          value: 'Option 1',
                        ),
                        PopupMenuItem(
                          child: Text('Oldest'),
                          value: 'Option 2',
                        ),
                      ],
                    );
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Newest',
                            style: TextStyle(fontSize: 7),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = "1";
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColor.primary),
                        Text('1')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = "2";
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColor.primary),
                        Text('2')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = "3";
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColor.primary),
                        Text('3')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = "4";
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColor.primary),
                        Text('4')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = "5";
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColor.border),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColor.primary),
                        Text('5')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Marium',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColor.primary,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Best Food I have ever had ',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12,
              );
            },
          ),
        ],
      ),
    );
  }
}
