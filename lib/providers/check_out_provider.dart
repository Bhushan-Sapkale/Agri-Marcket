import 'package:agri_market/models/delivery_address_model.dart';
import 'package:agri_market/models/review_cart_model.dart';
import 'package:agri_market/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();

  LocationData? setLocation;

  // Validator and Firestore Submission
  void validator(BuildContext context, AddressType myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last name is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile number is empty");
    } else if (alternateMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alternate mobile number is empty");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "Society is empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is empty");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "Landmark is empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode is empty");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "Set Location is empty");
    } else {
      isloading = true;
      notifyListeners();

      await FirebaseFirestore.instance.collection("AddDeliverAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstname": firstName.text,
        "lastname": lastName.text,
        "mobileNo": mobileNo.text,
        "alternateMobileNo": alternateMobileNo.text,
        "society": society.text,
        "street": street.text,
        "landmark": landmark.text,
        "area": area.text,
        "city": city.text,
        "pincode": pincode.text,
        "addressType": myType.toString(),
        "longitude": setLocation?.longitude,
        "latitude": setLocation?.latitude,
       // "cartId" : cartId,
      }).then((value) async {
        isloading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Address added successfully");
        Navigator.of(context).pop();
        notifyListeners();
      });
    }
  }
  List<DeliveryAddressModel> deliveryAddressList = [];
  void getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;

    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstname"),
        lastName: _db.get("lastname"),
        addressType: _db.get("addressType"),
        area: _db.get("area"),
        alternateMobileNo: _db.get("alternateMobileNo"),
        city: _db.get("city"),
        landMark: _db.get("landmark"),
        mobileNo: _db.get("mobileNo"),
        pinCode: _db.get("pincode"),
        society: _db.get("society"),
        street: _db.get("street"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
  return deliveryAddressList;
}

}
