import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Globals.dart' as globals;

class UserServices {
  SharedPreferences? sharedUserData;
  bool isloading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  var facebookLogin = FacebookLogin();
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final FacebookLoginResult result = await facebookLogin.expressLogin();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<void> fbLoginAndSaveData(BuildContext context) async {
    sharedUserData = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      globals.uid = value.user?.uid;
      print("+++++++++++++++++++++++++${globals.uid}");

      sharedUserData?.setString("uid", globals.uid);
      print(globals.uid);
    }).catchError((err) {
      print("Facebook Sign In Errrrrrrror => $err");
    });
  }

  void initiateFacebookLogin(BuildContext context) async {
    sharedUserData = await SharedPreferences.getInstance();
    facebookLogin = FacebookLogin();
    sharedUserData = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      globals.uid = value.user?.uid;
      print("+++++++++++++++++++++++++${globals.uid}");

      sharedUserData?.setString("uid", globals.uid);
      print(globals.uid);
    }).catchError((err) {
      print("Facebook Sign In Err0000000or => $err");
    });

    final FacebookLoginResult result = await facebookLogin.expressLogin();

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error => ${result.error.toString()}");
        print('erorrrrrrrrrrrrrrrrrrrrrrr');
        break;

      case FacebookLoginStatus.cancel:
        print("Cancel");
        break;

      case FacebookLoginStatus.success:
        print("logggggggggggggggggggin");
        final FacebookAccessToken? accessToken = result.accessToken;
        print('Access token: ${accessToken!.token}');
        // String _url =
        //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${result.accessToken!.token}';
        // var graphResponse = await http.get(Uri.parse(_url));

        // var profile = json.decode(graphResponse.body);
        // print(profile.toString());

        break;

      default:
    }
  }
}
