import 'package:agri_market/config/colors.dart';
import 'package:agri_market/screens/check_out/payment_summary/order_items.dart';
import 'package:flutter/material.dart';

class PaymentSummary extends StatefulWidget {
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();

}
enum AddressType { CashOnDelivery, OnlinePayment }

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.CashOnDelivery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Summary",
          style: TextStyle(fontSize: 18),),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\₹ 300",
          style: TextStyle(
            color: Colors.green[700],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "Place Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text("First & Last Name"),
                  subtitle: Text("rea, Chh Sambhaji nagar , street, 20, societ"),
                ),
                Divider(),
                ExpansionTile(
                  title: Text("Order Items 6"),
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\₹ 200",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\₹ 30",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Platform Fee",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\₹ 5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile<AddressType>(
                  value: AddressType.CashOnDelivery,
                  groupValue: myType,
                  title: Text("Cash on Delivery"),
                  onChanged: (AddressType? value) {
                    if (value != null) {
                      setState(() {
                        myType = value;
                      });
                    }
                  },
                  secondary: Icon(Icons.payments, color: primaryColor),
                ),

                RadioListTile<AddressType>(
                  value: AddressType.OnlinePayment,
                  groupValue: myType,
                  title: Text("Online Payment"),
                  onChanged: (AddressType? value) {
                    if (value != null) {
                      setState(() {
                        myType = value;
                      });
                    }
                  },
                  secondary: Icon(Icons.paypal, color: primaryColor),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
