import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dialoge extends StatefulWidget {
  @override
  DialogeState createState() => DialogeState();
}

class DialogeState extends State<Dialoge> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 360.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 40.0, right: 10.0, left: 10.0),
                    child: Text(
                      "Are You Sure You Want To Exit ?",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 40.0, right: 20.0),
                    child: FlatButton(
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(fontSize: 15.0),
                        ))),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 0.0),
                  child: Container(
                    height: 50.0,
                    width: 2.0,
                    color: Colors.orange,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 10.0, right: 30.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 15.0),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
