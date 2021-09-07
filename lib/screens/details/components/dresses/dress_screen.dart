import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/dresses/DressDetailScreen.dart';
import 'package:shop_app/screens/details/components/dresses/DressprouductCard.dart';
import 'package:shop_app/screens/details/components/dresses/dressProduct.dart';
import '../../../../constants.dart';

class DressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: dressProductslist.length,
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
                          builder: (context) => DressProuductDetail(
                            product: dressProductslist[index],
                          ),
                        ));
                  },
                  child: DressCard(
                      dressProuduct: dressProductslist[index], press: () {}));
            }),
      ),
    );
  }
}
