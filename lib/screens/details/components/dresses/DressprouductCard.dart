import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/dresses/dressProduct.dart';
import 'package:shop_app/screens/details/components/footwear/footwearprouduct.dart';

import '../../../../constants.dart';

class DressCard extends StatelessWidget {
  DressProduct dressProuduct;
  Function press;
  DressCard({
    Key? key,
    required this.dressProuduct,
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
                color: dressProuduct.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${dressProuduct.id}",
                child: Image.asset(dressProuduct.image!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // jwelleryprouducts is out demo list
              dressProuduct.title!,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${dressProuduct.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
