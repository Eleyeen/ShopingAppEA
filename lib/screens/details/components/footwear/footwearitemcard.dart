import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/footwear/footwearprouduct.dart';

import '../../../../constants.dart';

class FootwearCard extends StatelessWidget {
  Footwearprouduct footwearprouduct;
  Function press;
  FootwearCard({
    Key? key,
    required this.footwearprouduct,
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
                color: footwearprouduct.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${footwearprouduct.id}",
                child: Image.asset(footwearprouduct.image!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // jwelleryprouducts is out demo list
              footwearprouduct.title!,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${footwearprouduct.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
