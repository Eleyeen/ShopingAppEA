import 'package:flutter/cupertino.dart';

class ConfigSize {
  static convertHight(BuildContext context, double n) {
    double i = (n) / 683;
    return i * MediaQuery.of(context).size.longestSide;
  }

  static convertWidth(BuildContext context, double n) {
    double i = (n) / 411;
    return i * MediaQuery.of(context).size.width;
  }
  // static convertHightAndWidth(BuildContext context,double h, double w){
  //   double i = (h) / 683;
  //   double j = (w) / 411;

  // }
}
