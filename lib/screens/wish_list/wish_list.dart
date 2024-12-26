import 'package:agri_market/config/colors.dart';
import 'package:agri_market/models/product_model.dart';
import 'package:agri_market/providers/wish_list_provider.dart';
import 'package:agri_market/widgets/single_item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late WishListProvider wishlistProvider;

  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        wishlistProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wish Product"),
      content: Text("You want to Delete Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishlistProvider = Provider.of<WishListProvider>(context);
    wishlistProvider.getWishListData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body:
      wishlistProvider.getWishList.isEmpty?Center(
    child: Lottie.asset(
        'assets/wishList.json', // Add your animation file
        fit: BoxFit.contain),
    ):
      ListView.builder(
        itemCount: wishlistProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishlistProvider.getWishList[index];

          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context,data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
