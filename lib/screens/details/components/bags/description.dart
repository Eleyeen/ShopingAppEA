import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/bags/BegsProduct.dart';

import '../../../../constants.dart';

class Description extends StatelessWidget {
  Product product;

  Description({
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
