import 'package:agri_market/config/colors.dart';
import 'package:agri_market/models/product_model.dart';
import 'package:agri_market/providers/review_cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget{
  String productName;
  String productImage;
  String productId;
  var productUnit;
  int productPrice;

  Count({ this.productUnit, required this.productName, required this.productImage, required this.productId, required this.productPrice});
  @override
  _CountState createState() => _CountState();

}

class _CountState extends State<Count>{
  int count = 5;
  bool isTrue = false;

  getAddAndQuantity(){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get().then((value) => {
          if(this.mounted){
            if(value.exists){
              setState((){
                count = value.get("cartQuantity");
                isTrue = value.get("isAdd");
              })
            }
          }
    },);
  }
  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    // TODO: implement build
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: isTrue == true?Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){

              if(count==5){
                setState(() {
                  isTrue = false;
                });
                reviewCartProvider.reviewCartDataDelete(widget.productId);
              } else if(count > 5) {
                setState(() {
                  count --;
                });
                reviewCartProvider.updateReviewCartData(
                  cartId: widget.productId,
                  cartImage: widget.productImage,
                  cartName: widget.productName,
                  cartPrice: widget.productPrice,
                  cartQuantity: count,

                );
              }
            },
            child: Icon(
              Icons.remove,
              size: 15,
              color: Colors.lightGreen,
            ),
          ),
          Text(
            "$count",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                count ++;
              });
              reviewCartProvider.updateReviewCartData(
                cartId: widget.productId,
                cartImage: widget.productImage,
                cartName: widget.productName,
                cartPrice: widget.productPrice,
                cartQuantity: count,
              );
            },
            child: Icon(
              Icons.add,
              size: 15,
              color: Colors.lightGreen,
            ),
          ),
        ],
      ):Center(
        child: InkWell(
          onTap: (){
            setState(() {
              isTrue = true;
            });
            reviewCartProvider.addReviewCartData(
              cartId: widget.productId,
              cartImage: widget.productImage,
              cartName: widget.productName,
              cartPrice: widget.productPrice,
              cartQuantity: count,
             // cartUnit: widget.productUnit

            );
          },
          child: Text(
            "Add",
            style: TextStyle(color: primaryColor),
          ),
        ),
      )
    );
  }
}