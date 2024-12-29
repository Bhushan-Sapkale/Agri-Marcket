import 'package:agri_market/screens/product_overview/product_overview.dart';
import 'package:agri_market/widgets/count.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final Function onTap;
 // final List<String> productUnits; // Support for dynamic units

  SingleProduct({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.onTap,
    // this.productUnits, // Pass product units
  });

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productName: productName,
                        productImage: productImage,
                        productPrice: productPrice,
                        productId: productId,
                      ),
                    ));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(productImage, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
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
                      Text(
                        '₹$productPrice / Kg',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          //Expanded(
                          //   child: InkWell(
                          //     onTap: () {
                          //       showModalBottomSheet(
                          //           context: context,
                          //           builder: (context) {
                          //             return ListView.builder(
                          //               itemCount: productUnits.length,
                          //               shrinkWrap: true,
                          //               itemBuilder: (context, index) {
                          //                 return ListTile(
                          //                   title: Text(productUnits[index]),
                          //                   onTap: () {
                          //                     Navigator.pop(
                          //                         context, productUnits[index]);
                          //                   },
                          //                 );
                          //               },
                          //             );
                          //           });
                          //     },
                          //     child: Container(
                          //       padding: EdgeInsets.only(left: 5),
                          //       height: 30,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(
                          //           color: Colors.grey,
                          //         ),
                          //         borderRadius: BorderRadius.circular(5),
                          //       ),
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             child: Text(
                          //               'Select Unit',
                          //               style: TextStyle(fontSize: 12),
                          //             ),
                          //           ),
                          //           Icon(
                          //             Icons.arrow_drop_down,
                          //             color: Colors.green,
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                        //   ),
                          SizedBox(width: 5),
                          Count(
                            productId: productId,
                            productImage: productImage,
                            productName: productName,
                            productPrice: productPrice,
                          ),
                        ],
                      ),
                    ],
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
