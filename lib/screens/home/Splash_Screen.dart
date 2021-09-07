import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'LoginScreen.dart';
import 'components/No_internet_connectivity.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Globals.dart' as globals;

class Splash extends StatefulWidget {
  static const String id = "spalsh_screen";

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  bool isconnection = false;

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, nextpage);
  }

  void nextpage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // _auth.currentUser().then((user) {
    bool checkid = prefs.containsKey("uid");

    if (checkid) {
      String? uid = prefs.getString("uid");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
    globals.uid = uid!;
    }
    else {
      var route = MaterialPageRoute(builder: (BuildContext context) {
        return LoginWithPhoneAndFacebook();
      });
    Navigator.of(context).push(route);
    }
    // });
  }

  @override
  void initState() {
    super.initState();
    print("object");
    _checkInternetConnectivity();
  }

  _checkInternetConnectivity() async {
    var connectionResult = await (Connectivity().checkConnectivity());
    if (connectionResult == ConnectivityResult.none) {
      setState(() {
        isconnection = false;
      });
      _onBackPressed();
    } else {
      setState(() {
        isconnection = true;
      });
      controller = AnimationController(
          duration: const Duration(seconds: 2), vsync: this);
      animation = CurvedAnimation(
        parent: controller!,
        curve: Curves.easeIn,
      );
      controller!.forward();
      startTime();
    }
  }

  Future<bool?> _onBackPressed() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return DialogeNoInternet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isconnection == false
            ? Container()
            : Hero(
                tag: 'abc',
                child: Container(
                  color: Color(0xFFF8C078),
                  child: Center(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,

                    // height: ConfigSize.convertHight(context, 90),
                    // width: ConfigSize.convertWidth(context, 100),
                    child: Image.asset("assets/images/App logo.png"),
                  )),
                ),
              ));
  }
}
