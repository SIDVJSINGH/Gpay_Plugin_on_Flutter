import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pay/pay.dart';

void main(){
  runApp(Gpay());
}
const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];
class Gpay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Pay for Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: GpaySample(),
    );
  }
}
class GpaySample extends StatefulWidget {
  GpaySample({Key? key}) : super(key: key);

  @override
  _GpaySampleState createState() => _GpaySampleState();
}

class _GpaySampleState extends State<GpaySample>{
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Google Pay'),
      ),
      backgroundColor: Colors.blue[300],
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 300, horizontal: 60),
            child:GooglePayButton(
            paymentConfigurationAsset: 'gpay.json',
            width: 300,
            paymentItems: _paymentItems,
            type: GooglePayButtonType.buy,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ),
        ],
      ),
    );
  }
}