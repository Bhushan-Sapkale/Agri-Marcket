import 'package:agri_market/config/colors.dart';
import 'package:agri_market/models/delivery_address_model.dart';
import 'package:agri_market/providers/check_out_provider.dart';
import 'package:agri_market/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:agri_market/screens/check_out/dilevery_details/single_dilevery_item.dart';
import 'package:agri_market/screens/check_out/payment_summary/payment_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDeliverAddress(),
          ),);
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty ? Text("Add new Address"): Text("Payment  Summary"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty ?
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDeliverAddress(),
            ),):
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentSummary(
              deliveryAddressList: value,
            ),
            ),);
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset(
              "assets/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty ?
          Container(
            child: Center(
              child: Text("No Data"),
            ),
          ):
          Column(
            children: deliveryAddressProvider.getDeliveryAddressList.map<Widget>((e){
              setState((){
                value = e;
              });
              return  SingleDeliveryItem(
                address: "area: ${e.area}, street: ${e.street}, society: ${e.society}, city: ${e.city}, pincode:${e.pinCode}",
                title: "${e.firstName} ${e.lastName} ",
                number: e.mobileNo,
                addressType: e.addressType == "AddressType.Other"?"Other": e.addressType == "AddressType.Mess"?"Mess" : "Hotel",
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
