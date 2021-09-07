import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/jwellery/jwelleryProduct.dart';

import '../../../../constants.dart';

class JwelleryItemCard extends StatelessWidget {
  final Jwellery jwelleryprouduct;
  final Function press;
  const JwelleryItemCard({
    Key? key,
    required this.jwelleryprouduct,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: jwelleryprouduct.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${jwelleryprouduct.id}",
                child: Image.asset(jwelleryprouduct.image!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // jwelleryprouducts is out demo list
              jwelleryprouduct.title!,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${jwelleryprouduct.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
