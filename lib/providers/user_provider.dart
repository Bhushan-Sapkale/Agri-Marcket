import 'package:agri_market/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {required User currentUser,
        required String userName,
        required String userEmail,
        required String userImage}) async {
    await FirebaseFirestore.instance.collection("userData")
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userId": currentUser.uid,

    });
  }

  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance.collection("userData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (value.exists) {
      userModel = UserModel(
          userEmail: value.get("userEmail"),
          userImage: value.get("userImage"),
          userName: value.get("userName"),
          userId: value.get("userId")
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData{
    return currentData;

  }
}