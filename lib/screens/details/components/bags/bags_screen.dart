import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/bags/BegsProduct.dart';
import 'package:shop_app/screens/details/components/bags/details_screen.dart';
import 'package:shop_app/screens/details/components/bags/ItemCardScreen.dart';

import '../../../../constants.dart';

class BagsScreen extends StatelessWidget {
  BagsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(products[index].title);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ));
                },
                child: ItemCard(product: products[index], press: () {}),
              );
            }),
      ),
    );
  }
}
