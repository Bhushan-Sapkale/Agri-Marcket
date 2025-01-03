import 'package:agri_market/screens/check_out/payment_summary/payment_configuration.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

/// Use the Google Pay config directly from string
final defaultGooglePayConfigString = PaymentConfiguration.fromJsonString(defaultGooglePay);

class MyGooglePay extends StatefulWidget {
  final double total; // Ensure total is a double

  const MyGooglePay({Key? key, required this.total}) : super(key: key);

  @override
  _MyGooglePayState createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {

  void onGooglePayResult(paymentResult) {
    print('Google Pay Result: $paymentResult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pay'),
      ),
      body: Center(  // This will center the Google Pay button
        child: GooglePayButton(
          paymentConfiguration: defaultGooglePayConfigString,  // Use pre-loaded configuration
          paymentItems: [
            PaymentItem(
              label: 'Total',
              amount: widget.total.toString(),  // Convert double to string
              status: PaymentItemStatus.final_price,
            ),
          ],
          type: GooglePayButtonType.pay,
          onPaymentResult: onGooglePayResult,
          margin: const EdgeInsets.only(top: 15.0),
          loadingIndicator: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
