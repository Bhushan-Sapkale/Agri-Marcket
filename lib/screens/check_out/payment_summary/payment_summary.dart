import 'package:agri_market/config/colors.dart';
import 'package:agri_market/models/delivery_address_model.dart';
import 'package:agri_market/providers/review_cart_provider.dart';
import 'package:agri_market/screens/check_out/dilevery_details/single_dilevery_item.dart';
import 'package:agri_market/screens/check_out/payment_summary/mygoogle_pay.dart';
import 'package:agri_market/screens/check_out/payment_summary/order_items.dart';
import 'package:agri_market/screens/home_screen/anime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {

  final DeliveryAddressModel deliveryAddressList;
  PaymentSummary({required this.deliveryAddressList});
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();

}
enum AddressType { CashOnDelivery, OnlinePayment }

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.CashOnDelivery;

  @override
  Widget build(BuildContext context) {

    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    final shipping = 30.0;
    final  platformFee = 5.0;
    final totalPrice = reviewCartProvider.getTotalPrice();
    final finalPrice = totalPrice+shipping+platformFee;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Summary",
          style: TextStyle(fontSize: 18),),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\₹ ${finalPrice}",
          style: TextStyle(
            color: Colors.green[700],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == AddressType.OnlinePayment? Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context)=>MyGooglePay(
                total: finalPrice, //
              ),
              ),):Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Anime(),));
            },
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
            SingleDeliveryItem(
            address: "area: ${widget.deliveryAddressList.area}, street: ${widget.deliveryAddressList.street},"
                " society: ${widget.deliveryAddressList.society}, city: ${widget.deliveryAddressList.city}, "
                "pincode:${widget.deliveryAddressList.pinCode}",
              title: "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName} ",
              number: widget.deliveryAddressList.mobileNo,
              addressType: widget.deliveryAddressList.addressType == "AddressType.Other"?"Other" :
              widget.deliveryAddressList.addressType == "AddressType.Mess"?"Mess" : "Hotel",
            ),
                Divider(),
                ExpansionTile(
                  title: Text("Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                  children:  reviewCartProvider.getReviewCartDataList.map((e){
                    return OrderItem(e: e,);
            }).toList(),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\₹ ${totalPrice}",
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
                    "\₹ ${shipping}",
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
                    "\₹ ${platformFee}",
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
