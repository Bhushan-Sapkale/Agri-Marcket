import 'package:agri_market/models/review_cart_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final bool? isTrue;
  final ReviewCartModel e;
  OrderItem({ this.isTrue,required this.e});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
       e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "\₹ ${e.cartPrice}",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    ); // ListTile
  }
}
