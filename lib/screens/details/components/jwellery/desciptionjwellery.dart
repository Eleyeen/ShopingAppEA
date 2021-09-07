import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/jwellery/jwelleryProduct.dart';

import '../../../../constants.dart';

class Descriptionjwellery extends StatelessWidget {
  const Descriptionjwellery({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Jwellery product;

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
