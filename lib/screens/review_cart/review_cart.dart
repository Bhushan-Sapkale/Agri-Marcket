import 'package:agri_market/config/colors.dart';
import 'package:agri_market/widgets/single_item.dart';
import 'package:flutter/material.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          " 170.00",
          style: TextStyle(
            color: Colors.green[900],
          ), // TextStyle
        ), // Text
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ), // RoundedRectangleBorder
            onPressed: () {

            },
          ), // MaterialButton
        ), // Container
      ), // ListTile
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ), // Text
      ), // AppBar
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ), // SizedBox

          SingleItem(isBool: true,
          ), // SingleItem

          SingleItem(
            isBool: true,
          ), // SingleItem
          // SingleItem(
          //   isBool: true,
          // ), // SingleItem
          // SingleItem(
          //   isBool: true,
          // ), // SingleItem
          SizedBox(
            height: 10,
          ), // SizedBox
        ],
      ), // ListView
    ); // Scaffold
  }
}