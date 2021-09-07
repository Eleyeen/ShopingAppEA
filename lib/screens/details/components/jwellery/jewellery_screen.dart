import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/jwellery/jwelleryProduct.dart';
import 'package:shop_app/screens/details/components/jwellery/jwellerydetailscreen.dart';
import 'package:shop_app/screens/details/components/jwellery/jwelleryitemcard.dart';

import '../../../../constants.dart';

class JewelleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: jwellerys.length,
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
                        builder: (context) => JwelleryDetailScreen(
                          product: jwellerys[index],
                        ),
                      ));
                },
                child: JwelleryItemCard(
                    jwelleryprouduct: jwellerys[index], press: () {}),
              );
            }),
      ),
    );
  }
}
