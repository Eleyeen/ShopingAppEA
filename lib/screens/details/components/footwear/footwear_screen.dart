import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/bags/BegsProduct.dart';
import 'package:shop_app/screens/details/components/footwear/footweardetailscreen.dart';
import 'package:shop_app/screens/details/components/footwear/footwearprouduct.dart';
import 'package:shop_app/screens/details/components/jwellery/jwelleryProduct.dart';
import 'package:shop_app/screens/details/components/bags/details_screen.dart';
import 'package:shop_app/screens/details/components/footwear/footwearitemcard.dart';

import '../../../../constants.dart';

class FootwearScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: footwearprouducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FootwearDetailScreen(
                          product: footwearprouducts[index],
                        ),
                      ));
                },
                child: FootwearCard(
                    footwearprouduct: footwearprouducts[index], press: () {}),
              );
            }),
      ),
    );
  }
}
