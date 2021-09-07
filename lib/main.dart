import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/Splash_Screen.dart';
// import 'package:shop_app/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(MyApp());
}

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('de', ''),
      ],
      theme: ThemeData(
        backgroundColor: Colors.orange,
        primaryColor: Colors.orange,
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.amberAccent,
          thumbColor: Colors.blueAccent,
          valueIndicatorColor: Colors.deepOrange,
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
