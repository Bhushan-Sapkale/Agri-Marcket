import 'package:agri_market/screens/product_overview/product_overview.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget{
  final String productImage;
  final String productName;
  final Function onTap;
  SingleProduct({required this.productImage, required this.productName, required this.onTap});
  @ override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 260,
            width: 160,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> ProductOverview(productName: productName,productImage: productImage,

                        )));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(productImage),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('₹10/50 Gram',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),

                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(child: Text('50 gram',style: TextStyle(fontSize: 11),)),
                                    Center(
                                      child: Expanded(
                                        child: Icon(Icons.keyboard_double_arrow_down,
                                          size: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),

                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove,
                                      size: 15,
                                      color: Colors.lightGreen,),
                                    Text('1',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    Icon(Icons.add,
                                      size: 15,
                                      color: Colors.lightGreen,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}