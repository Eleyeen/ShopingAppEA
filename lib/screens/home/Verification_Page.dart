import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Globals.dart' as globals;
import 'package:shop_app/screens/home/home_screen.dart';

class VerificationPage extends StatefulWidget {
  String? phone;
  VerificationPage({Key? key, required this.phone}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState(phone: phone!);
}

class _VerificationPageState extends State<VerificationPage> {
  String? phone;
  String? smsCode;
  String? verificationId;
  String? pinCode = '';
  FutureProgressDialog? progressDialog;

  _VerificationPageState({required this.phone});
  String? _verificationCode;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController? _pinPutController = TextEditingController();
  FocusNode? _pinPutFocusNode = FocusNode();
  BoxDecoration? pinPutDecoration = BoxDecoration(
    color: Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  void initState() {
    print("phone number is $phone");
    super.initState();
    _verifyPhone();
  }

  @override
  void dispose() {
    _pinPutController!.dispose();
    super.dispose();
  }

  _verifyPhone() async {
    print("+++++++++++++++++++++$phone");
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone!,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              SharedPreferences sharedUserData;
              sharedUserData = await SharedPreferences.getInstance();
              sharedUserData.setString("uid", value.user!.uid);
              globals.uid = value.user!.uid;
              print("+++++++++++++++++++++++++${globals.uid}");

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  Widget build(BuildContext context) {
    //  showDialog(
    //     context: context,
    //     builder: (context) =>
    //         FutureProgressDialog(getFuture(), message: Text('Verifying...',

    //         )),
    //   );
    // progressDialog =
    //     new ProgressDialog(context, type: ProgressDialogType.Normal);
    // progressDialog!
    //   ..style(
    //       message: 'Verifying...',
    //       borderRadius: 10.0,
    //       backgroundColor: Colors.white,
    //       progressWidget: CircularProgressIndicator(),
    //       elevation: 10.0,
    //       insetAnimCurve: Curves.easeInOut,
    //       progress: 0.0,
    //       maxProgress: 100.0,
    //       progressTextStyle: TextStyle(
    //           color: Colors.green,
    //           // fontFamily: fonts.sExtraL,
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.w400),
    //       messageTextStyle: TextStyle(
    //           color: Colors.green,
    //           // fontFamily: fonts.sLight,
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.w400));

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[verifi()],
        ),
      ),
    );
  }

  verifi() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 80.0),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 3,
                child: Icon(
                    // Icons.shop_2,
                    Icons.shop)),
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: Text(
                "NUMBER VERIFICATION",
                style: TextStyle(
                    color: Colors.white,
                    // fontFamily: fonts.mBold,
                    fontSize: 22),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width * 3,
              margin: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.topCenter,
              child: Text(
                "Waiting to automatically detect an SMS sent to",
                style: TextStyle(
                    color: Colors.white,
                    // fontFamily: fonts.sBold,
                    fontSize: 13),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text("$phone",
                  style: TextStyle(
                      color: Colors.white,
                      // fontFamily: fonts.mBold,
                      fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Divider(
                  color: Colors.white,
                  height: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Enter the 6- digit code",
                  style: TextStyle(
                      color: Colors.white,
                      // fontFamily: fonts.mRegular,
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _pinPutController!.text.length < 6
                  ? Container()
                  : FlatButton(
                      onPressed: () async {
                        if (_pinPutController!.text.length == 6) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode!,
                                        smsCode: _pinPutController!.text))
                                .then((value) async {
                              if (value.user != null) {
                                SharedPreferences sharedUserData;
                                sharedUserData =
                                    await SharedPreferences.getInstance();
                                sharedUserData.setString(
                                    'uid', value.user!.uid);
                                globals.uid = value.user!.uid;
                                print(
                                    "+++++++++---------------++++++++++++++++${globals.uid}");
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            _scaffoldkey.currentState!.showSnackBar(
                                SnackBar(content: Text('invalid OTP')));
                          }
                        } else {}
                        // progressDialog.show();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                            (route) => false);
                        ///////////////////////

                        print(
                            "\n\n\n\n\n\ flate button detect pin code ${_pinPutController!.text} \n\n\n\n\n\n\n");
                      },
                      child: Text(
                        "PROCEED",
                        style: TextStyle(
                            color: Colors.blue,
                            // fontFamily: fonts.sExtraL,
                            fontSize: 16),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
