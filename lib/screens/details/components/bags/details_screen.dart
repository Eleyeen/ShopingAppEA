import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay/pay.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/pay_dialog.dart';

import 'package:shop_app/screens/details/components/bags/BegsProduct.dart';
import 'package:shop_app/models/Globals.dart' as globals;

import 'color_and_size.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _paymentItems = <PaymentItem>[];
  int numOfItems = 1;
  final firestoreInstance = FirebaseFirestore.instance;
  void _onPressed() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    print(firebaseUser!.displayName);
    print(firebaseUser.email);
    firestoreInstance.collection("alluserorder").doc(globals.uid).set({
      "name": firebaseUser.displayName,
      "age": 50,
      "email": firebaseUser.email,
      "address": {"street": "street 24", "city": "new york"}
    }).then((_) {
      print("success!");
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    _paymentItems.add(PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // each product have a color
      backgroundColor: widget.product.color,
      appBar: buildAppBar(context, numOfItem: numOfItems),
      // body: Body(product: product),
      body: SingleChildScrollView(
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
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
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: widget.product.color,
                                    onPressed: () async {
                                      // _onPressed();
                                      print(
                                          'sssssssssssssssssssssssssssssssssssssssssssssssssssssssss');

                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return PayDialoge();
                                          });
                                    },
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

  AppBar buildAppBar(BuildContext context, {int? numOfItem}) {
    return AppBar(
      backgroundColor: widget.product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/cart.svg"),
              onPressed: () {},
            ),
            Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFFFF6464), shape: BoxShape.circle),
              child: Text(
                numOfItems.toString(),
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            )
          ],
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
