import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Globals.dart' as globals;
import 'package:shop_app/models/Social_Login.dart';
import 'package:shop_app/screens/home/Verification_Page.dart';

class LoginWithPhoneAndFacebook extends StatefulWidget {
  const LoginWithPhoneAndFacebook({key}) : super(key: key);

  @override
  _LoginWithPhoneAndFacebookState createState() =>
      _LoginWithPhoneAndFacebookState();
}

class _LoginWithPhoneAndFacebookState extends State<LoginWithPhoneAndFacebook> {
  TextEditingController controller = TextEditingController();
  // AuthResult user;
  // String userTokenNo;

  String _phoneNumber = '';
  String _countryCode = "+92";
  String? _fullNumber;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'abc',
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 70),
                height: height / 3,
                width: width / 3,
                child: Image.asset("assets/images/App logo.png"),
              ),
            ),
            Container(
              // height: height / 18,
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                children: <Widget>[
                  Container(
                    // height: height / 2,
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: CountryCodePicker(
                      onChanged: (value) {
                        this._countryCode = value.toString();
                        print(_countryCode);
                      },
                      initialSelection: 'pk',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(right: 5.0),
                    width: 1.0,
                    height: 30.0,
                    color: Colors.white,
                  ),
                  Flexible(
                    flex: 1,
                    child: TextField(
                        showCursor: false,
                        controller: controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [],
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '_______________________________',
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            this._phoneNumber = value;
                            globals.fullNumber =
                                this._countryCode + this._phoneNumber;
                            print("full number = " + globals.fullNumber);
                          });
                        }),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              height: height / 20,
              width: width / 3,
              child: FlatButton(
                onPressed: () {
                  if (this._phoneNumber.isNotEmpty) {
                    this._fullNumber = this._countryCode + this._phoneNumber;
                    print("\n\n\n\n\n\n\n$_fullNumber hyyy\n\n\n\n\n\n");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationPage(
                                phone: _fullNumber!,
                              )),
                    );
                  }
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.white,
                      // fontFamily: fonts.mBold,
                      fontSize: 16),
                ),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              child: Row(children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 2.0,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black,
                        // fontFamily: fonts.mBold,
                        fontSize: 22),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2.0,
                  color: Colors.black,
                )),
              ]),
            ),
            Container(
              height: height / 13,
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Continue with",
                style: TextStyle(
                    color: Colors.blue,
                    // fontFamily: fonts.mBold,
                    fontSize: 18),
              ),
            ),
            InkWell(
              onTap: () {
                UserServices().initiateFacebookLogin(context);
              },
              child: btnFb(
                'Login with Facebook',
                // colors.fbBlue,
                Colors.orange,
                Colors.white,
                18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btnFb(String text, Color bgColor, Color textColor, double size) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: new Container(
          alignment: Alignment.center,
          // width: 292.0,
          height: 50.0,
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: new BoxDecoration(
            color: bgColor,
            borderRadius: new BorderRadius.circular(50.0),
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 20),
                // child: icons.fb,
                child: Icon(
                  // Icons.facebook_sharp,
                  Icons.face,
                  color: Colors.white,
                ),
              ),
              new Text(
                text,
                style: new TextStyle(
                  fontSize: size,
                  color: textColor,
                ),
              ),
            ],
          )),
    );
  }
}
