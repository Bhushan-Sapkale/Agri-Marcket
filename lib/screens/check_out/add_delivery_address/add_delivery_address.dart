import 'package:agri_market/config/colors.dart';
import 'package:agri_market/providers/check_out_provider.dart';
import 'package:agri_market/screens/check_out/google_map/google_map.dart';
import 'package:agri_market/widgets/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressType { Hotel, Mess, Other }

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressType.Hotel;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery Address"),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloading == false
            ? MaterialButton(
          onPressed: () {
            checkoutProvider.validator(context, myType);
          },
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CustomTextField(
              labText: "Society",
              controller: checkoutProvider.society,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: "LandMark",
              controller: checkoutProvider.landmark,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomGoogleMap()),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation == null
                        ? Text("Set Location")
                        : Text("Done"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(" Address Type "),
            ),
            RadioListTile<AddressType>(
              value: AddressType.Hotel,
              groupValue: myType,
              title: Text("Hotel"),
              onChanged: (AddressType? value) {
                if (value != null) {
                  setState(() {
                    myType = value;
                  });
                }
              },
              secondary: Icon(Icons.restaurant, color: primaryColor),
            ),
            RadioListTile<AddressType>(
              value: AddressType.Mess,
              groupValue: myType,
              title: Text("Mess"),
              onChanged: (AddressType? value) {
                if (value != null) {
                  setState(() {
                    myType = value;
                  });
                }
              },
              secondary: Icon(Icons.home_filled, color: primaryColor),
            ),
            RadioListTile<AddressType>(
              value: AddressType.Other,
              groupValue: myType,
              title: Text("Others"),
              onChanged: (AddressType? value) {
                if (value != null) {
                  setState(() {
                    myType = value;
                  });
                }
              },
              secondary: Icon(Icons.devices_other_sharp, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
