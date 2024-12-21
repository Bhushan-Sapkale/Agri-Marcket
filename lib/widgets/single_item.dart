import 'package:agri_market/config/colors.dart';
import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isBool =false;
  SingleItem({required this.isBool});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(
                      "https://tse2.mm.bing.net/th?id=OIP.jZ8KKoHTdOAe-K3a_T0mhAAAAA&pid=Api&P=0&h=180",
                    ),
                  ), // Center
                ), // Container
              ), // Expanded
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Basil1",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "50\$/50 Gram",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      isBool==false? Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ), // BoxDecoration
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "50 Gram",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ), // TextStyle
                              ), // Text
                            ), // Expanded
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ), // Row
                      ):Text("50 Gram ") // Container
                    ],
                  ), // Column
                ), // Container
              ), // Expanded
              Expanded(
                  child: Container(
                      height: 100,
                      padding: isBool ==false
                          ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                          :EdgeInsets.only(left: 15,right: 15),
                      child:isBool ==false ? Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ), // BoxDecoration
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: primaryColor,
                                size: 20,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                ), // TextStyle
                              ),
                            ],
                            //child: Icon(Icons.search, color: primaryColor),
                          ),
                        ),
                      )
                          : Column(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            height:5 ,
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ), // BoxDecoration
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                  Text(
                                    "ADD",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                    ), // TextStyle
                                  ),
                                ],
                                //child: Icon(Icons.search, color: primaryColor),
                              ),
                            ),
                          )
                        ],
                      )// Inner// Container
                  ) // Outer Container
              ), // Expanded

            ],
          ), // Row
        ),
        isBool==false?Container():Divider(
            height: 1,
            color: Colors.black45
        )
      ],
    );
    // Padding
  }
}