import 'package:agri_market/config/colors.dart';
import 'package:agri_market/models/product_model.dart';
import 'package:agri_market/screens/product_overview/product_overview.dart';
import 'package:agri_market/widgets/count.dart';
import 'package:agri_market/widgets/product_unit.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final Function onTap;
  final ProductModel productUnit;

  SingleProduct({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.onTap,
     required this.productUnit
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element){
      setState(() {
        firstValue = element;
      });
      return true;
    });
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
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productPrice: widget.productPrice,
                        productId: widget.productId,
                      ),
                    ));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(widget.productImage),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\₹${widget.productPrice} /KG',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: (){
                                  showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: widget.productUnit.productUnit.map<Widget>((data){
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            unitData = data;
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Text(
                                                            data,
                                                            style: TextStyle(
                                                              color: primaryColor,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }).toList(),

                                              );
                                            });
                                },
                                title: unitData == null ?firstValue : unitData,
                              ),
                            ),
                            SizedBox(width: 5),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit: unitData == null?firstValue:unitData,
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



// import 'package:agri_market/screens/product_overview/product_overview.dart';
// import 'package:agri_market/widgets/count.dart';
// import 'package:flutter/material.dart';
//
// class SingleProduct extends StatelessWidget{
//   final String productImage;
//   final String productName;
//   final int productPrice;
//   final String productId;
//   final Function onTap;
//   SingleProduct({
//     required this.productImage,
//     required this.productName,
//     required this.productPrice,
//     required this.productId,
//     required this.onTap});
//   @ override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             height: 260,
//             width: 160,
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context)=> ProductOverview(
//                           productName: productName,
//                           productImage: productImage,
//                           productPrice: productPrice,
//                           productId: productId,
//
//                         )));
//                   },
//                   child: Container(
//                     height: 150,
//                     padding: EdgeInsets.all(5),
//                     width: double.infinity,
//                     child: Image.network(productImage),
//                   ),
//                 ),
//
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text('\₹$productPrice /Kg',
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: InkWell(
//                                 onTap: (){
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: <Widget>[
//                                             ListTile(
//                                               title: new Text('1 Kg'),
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                             ),
//                                             ListTile(
//                                               title: new Text('5 Kg'),
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                             ),
//                                             ListTile(
//                                               title: new Text('10 Kg'),
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                             ),
//                                             ListTile(
//                                               title: new Text('15 Kg'),
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                             ),
//                                           ],
//                                         );
//                                       });
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.only(left: 5),
//                                   height: 30,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Colors.grey,
//                                     ),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                           child: Text(
//                                             '50 gram',
//                                             style: TextStyle(fontSize: 11),
//                                           )
//                                       ),
//                                       Center(
//                                         child: Expanded(
//                                           child: Icon(Icons.keyboard_double_arrow_down,
//                                             size: 18,
//                                             color: Colors.green,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 5,),
//                             Count(
//                               productId: productId,
//                               productImage: productImage,
//                               productName: productName,
//                               productPrice: productPrice,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }