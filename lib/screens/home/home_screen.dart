import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/LoginScreen.dart';
import 'package:shop_app/screens/home/components/mainbody.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> patientscafolkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: patientscafolkey,
      appBar: buildAppBar(),
      body: Body(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(),
            createDrawerBodyItem(icon: Icons.home, text: 'Home'),
            createDrawerBodyItem(icon: Icons.account_circle, text: 'Profile'),
            createDrawerBodyItem(icon: Icons.event_note, text: 'Events'),
            Divider(),
            createDrawerBodyItem(
                icon: Icons.notifications_active, text: 'Notifications'),
            createDrawerBodyItem(
                icon: Icons.logout,
                text: 'Log Out',
                onTap: () async {
                  SharedPreferences local =
                      await SharedPreferences.getInstance();
                  local.clear();
                  var newRoute = MaterialPageRoute(
                      builder: (context) => LoginWithPhoneAndFacebook());
                  Navigator.pushAndRemoveUntil(
                      context, newRoute, (route) => false);
                }),
            ListTile(
              title: Text('App version 1.0.0'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                // fit: BoxFit.fill,
                image: AssetImage('assets/images/App logo.png'))),
        child: Text("",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500)));
  }

  Widget createDrawerBodyItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // patientscafolkey.currentState!.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
