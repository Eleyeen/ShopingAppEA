import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/dialog.dart';

import 'categorries.dart';

class Body extends StatefulWidget {
  final int index = 0;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<bool> _onback() async {
    return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialoge();
            }) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Categories(
                // index: widget.index,
                ),
          ),
        ],
      ),
    );
  }
}
