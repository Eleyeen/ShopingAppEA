import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/components/bags/BegsProduct.dart';

import 'add_to_cart.dart';
import 'cart_counter.dart';
import 'bags/color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'bags/description.dart';
import 'bags/product_title_with_image.dart';

class Body extends StatefulWidget {
  Product product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int numOfItems = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: widget.product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: widget.product),
                      SizedBox(height: kDefaultPaddin / 2),
                      // CounterWithFavBtn(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // CartCounter(),
                          Row(
                            children: <Widget>[
                              buildOutlineButton(
                                icon: Icons.remove,
                                press: () {
                                  if (numOfItems > 1) {
                                    setState(() {
                                      numOfItems--;
                                    });
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddin / 2),
                                child: Text(
                                  // if our item is less  then 10 then  it shows 01 02 like that
                                  numOfItems.toString().padLeft(2, "0"),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              buildOutlineButton(
                                  icon: Icons.add,
                                  press: () {
                                    setState(() {
                                      numOfItems++;
                                    });
                                  }),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6464),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      // AddToCart(product: product),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPaddin),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  height: 60,
                                  width: 70,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: widget.product.color!,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/icons/add_to_cart.svg",
                                        color: widget.product.color,
                                      ),
                                      onPressed: () {
                                        print("Cart Pressed");
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF6464),
                                      shape: BoxShape.circle),
                                  child: Text(
                                    numOfItems.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  color: widget.product.color,
                                  onPressed: () {},
                                  child: Text(
                                    "Buy  Now".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: widget.product)
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox buildOutlineButton({IconData? icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press(),
        child: Icon(icon),
      ),
    );
  }
}
