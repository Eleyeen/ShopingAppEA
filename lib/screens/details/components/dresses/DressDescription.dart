import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/dresses/dressProduct.dart';
import 'package:shop_app/screens/details/components/footwear/footwearprouduct.dart';

import '../../../../constants.dart';

class DressDescription extends StatelessWidget {
  DressProduct product;

  DressDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description!,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
