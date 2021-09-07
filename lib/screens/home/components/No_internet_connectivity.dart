import 'package:flutter/material.dart';
// import 'package:doctor_complete_app/Resources/All_Colors.dart' as customColor;
// import 'package:doctor_complete_app/Resources/Fonts.dart' as fonts;
import 'ConfigSize.dart';
import 'package:flutter/services.dart';

class DialogeNoInternet extends StatefulWidget {
  @override
  DialogeNoInternetState createState() => DialogeNoInternetState();
}

class DialogeNoInternetState extends State<DialogeNoInternet> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Container(
        height: ConfigSize.convertHight(context, 185),
        width: ConfigSize.convertWidth(context, 350),
        child: Column(
          children: <Widget>[
            Container(
              height: ConfigSize.convertHight(context, 85),
              width: ConfigSize.convertWidth(context, 350),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, right: 10.0, left: 12.0),
                    child: Text(
                      "PLease Make Sure You Are \n  Connected To Internet ",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFF8C078),
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 60.0, right: 20.0),
                    child: TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "Retry",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ))),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 0.0),
                  child: Container(
                    height: 50.0,
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 20.0, right: 30.0),
                    child: TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
