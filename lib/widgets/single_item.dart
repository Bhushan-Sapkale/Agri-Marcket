// import 'package:agri_market/config/colors.dart';
// import 'package:agri_market/providers/review_cart_provider.dart';
// import 'package:agri_market/widgets/count.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
//
// class SingleItem extends StatefulWidget {
//   bool isBool =false;
//   bool? wishList = false;
//   String productName;
//   String productImage;
//   int productPrice;
//   String productId;
//   int? productQuantity;
//   VoidCallback? onDelete;
//   var productUnit;
//   SingleItem({required this.isBool,
//      this.wishList,
//      required this.productName,
//      required this.productImage,
//      required this.productPrice,
//     required this.productId,
//       this.productQuantity,
//      this.onDelete,
//     this.productUnit,
//   });
//   @override
//   State<SingleItem> createState() => _SingleItemState();
// }
//
// class _SingleItemState extends State<SingleItem> {
//   late ReviewCartProvider reviewCartProvider;
//   late int count;
//
//   void getCount() {
//     setState(() {
//       count = widget.productQuantity!;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getCount();
//     reviewCartProvider = Provider.of<ReviewCartProvider>(context);
//     reviewCartProvider.getReviewCartData();
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Row(
//             children: [
//               // Ensure `Expanded` is within `Row`
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   child: Center(
//                     child: Image.network(widget.productImage),
//                   ),
//                 ),
//               ),
//               // Expanded for details
//               Expanded(
//                 flex: 2, // Adding more flexibility for text layout
//                 child: Container(
//                   height: 100,
//                   child: Column(
//                     mainAxisAlignment: widget.isBool == false
//                         ? MainAxisAlignment.spaceAround
//                         : MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Text widgets remain unchanged
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.productName,
//                             style: TextStyle(
//                               color: textColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "${widget.productPrice} ₹",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       if (!widget.isBool)
//                         GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       ListTile(
//                                         title: const Text('1 Kg'),
//                                         onTap: () => Navigator.pop(context),
//                                       ),
//                                       ListTile(
//                                         title: const Text('5 Kg'),
//                                         onTap: () => Navigator.pop(context),
//                                       ),
//                                       ListTile(
//                                         title: const Text('10 Kg'),
//                                         onTap: () => Navigator.pop(context),
//                                       ),
//                                       ListTile(
//                                         title: const Text('15 Kg'),
//                                         onTap: () => Navigator.pop(context),
//                                       ),
//                                     ],
//                                   );
//                                 });
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             height: 35,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "50 Gram",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Icon(
//                                     Icons.arrow_drop_down,
//                                     size: 20,
//                                     color: primaryColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       else
//                          Text(widget.productUnit),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   height: 100,
//                   padding: widget.isBool == false
//                       ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
//                       : const EdgeInsets.only(left: 15, right: 15),
//                   child: widget.isBool == false
//                       ? Count(
//                     productName: widget.productName,
//                     productImage: widget.productImage,
//                     productId: widget.productId,
//                     productPrice: widget.productPrice,
//
//
//                   )
//                       : Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: widget.onDelete,
//                           child: const Icon(
//                             Icons.delete,
//                             size: 30,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         if (widget.wishList == false)
//                           Container(
//                             height: 25,
//                             width: 70,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     if (count==5) {
//                                       Fluttertoast.showToast(
//                                           msg: "You reach Minimum Limit");
//
//                                     } else {
//                                       setState(() {
//                                         count--;
//                                       });
//                                       reviewCartProvider.updateReviewCartData(
//                                         cartId: widget.productId,
//                                         cartName: widget.productName,
//                                         cartImage: widget.productImage,
//                                         cartPrice: widget.productPrice,
//                                         cartQuantity: count,
//                                       );
//                                     }
//                                   },
//                                   child: Icon(Icons.remove, color: primaryColor, size: 20),
//                                 ),
//                                 Text(
//                                   "$count",
//                                   style: TextStyle(
//                                       color: primaryColor, fontSize: 14),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     if (count < 10) {
//                                       setState(() {
//                                         count++;
//                                       });
//                                       reviewCartProvider.updateReviewCartData(
//                                         cartId: widget.productId,
//                                         cartName: widget.productName,
//                                         cartImage: widget.productImage,
//                                         cartPrice: widget.productPrice,
//                                         cartQuantity: count,
//                                       );
//                                     }
//                                   },
//                                   child: Icon(Icons.add, color: primaryColor, size: 20),
//                                 ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (widget.isBool)
//           const Divider(
//             height: 1,
//             color: Colors.black45,
//           )
//       ],
//     );
//   }
// }



import 'package:agri_market/config/colors.dart';
import 'package:agri_market/providers/review_cart_provider.dart';
import 'package:agri_market/widgets/count.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool =false;
  bool? wishList = false;
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int productQuantity;
  VoidCallback? onDelete;
  SingleItem({
    required this.isBool,
      this.wishList,
     required this.productName,
     required this.productImage,
     required this.productPrice,
     required this.productId,
    required this.productQuantity,
     this.onDelete,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;

  void getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   // TODO: implement initState
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
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
                     widget.productImage
                    ),
                  ), // Center
                ), // Container
              ), // Expanded
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.productPrice}\₹",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      height: 100,
                      padding: widget.isBool ==false
                          ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                          :EdgeInsets.only(left: 15,right: 15),
                      child:widget.isBool ==false
                          ? Count(
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productId: widget.productId,
                          productPrice: widget.productPrice
                      ) : Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                            InkWell(
                              onTap: widget.onDelete,
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height:5 ,
                            ),
                            widget.wishList == false?
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        if(count==5){
                                          Fluttertoast.showToast(msg: "You reach Minimum Limit");
                                        }else{
                                          setState(() {
                                            count--;
                                          });
                                          reviewCartProvider.updateReviewCartData(
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartImage: widget.productImage,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count);
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "$count",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        if(count<10){
                                          setState(() {
                                            count++;
                                          });
                                          reviewCartProvider.updateReviewCartData(
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartImage: widget.productImage,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count);
                                        }
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                  //child: Icon(Icons.search, color: primaryColor),
                                ),
                              ),
                            )
                                :Container(),
                              ],
                            ),
                          )
                  )
              ),
            ],
          ),
        ),
        widget.isBool==false?Container():Divider(
            height: 1,
            color: Colors.black45
        ),
      ],
    );
    // Padding
  }
}