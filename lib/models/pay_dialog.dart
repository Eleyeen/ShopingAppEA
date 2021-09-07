import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay/pay.dart';

class PayDialoge extends StatefulWidget {
  @override
  PayDialogeState createState() => PayDialogeState();
}

class PayDialogeState extends State<PayDialoge> {
  final _paymentItems = <PaymentItem>[];

  @override
  void initState() {
    // TODO: implement initState
    _paymentItems.add(PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
      
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 360.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 40.0, right: 10.0, left: 10.0),
                    child: Text(
                      "buy  to  Google pay acoount",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
              child: GooglePayButton(
                paymentConfigurationAsset: 'google_pay_payment_profile.json',
                paymentItems: _paymentItems,
                
               onError: (data){
                  print("printttttttttttttttttttttttttttttttttttttttttttttttttttttttt");


               },
                width: 200,
                height: 40,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (data) {
                  print(data);
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

 