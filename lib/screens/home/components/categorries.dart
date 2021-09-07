import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/components/bags/bags_screen.dart';
import 'package:shop_app/screens/details/components/dresses/dress_screen.dart';
import 'package:shop_app/screens/details/components/footwear/footwear_screen.dart';
import 'package:shop_app/screens/details/components/jwellery/jewellery_screen.dart';

class Categories extends StatefulWidget {
  // int index;
  // Categories({this.index});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  // By default our first item will be selected
  // int selectedIndex = 0;
  int myIndex = 0;
  List<Widget> myWidgetList = [
    BagsScreen(),
    JewelleryScreen(),
    FootwearScreen(),
    DressScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: SizedBox(
              height: 28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
          // Container(
          //   height: 20,
          //   color: Colors.red,
          // )
          myWidgetList[myIndex]
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          myIndex = index;
          print(index);
          // widget.index++;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: myIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 3,
              width: 60,
              color: myIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
