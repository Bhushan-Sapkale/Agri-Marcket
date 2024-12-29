import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final bool? isTrue;

  OrderItem({ this.isTrue});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://i.dlpng.com/static/png/1323576-watermelon-png-png-picture-of-watermelon-1400_965_previous.png",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Food Name",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "50 Gram",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "\₹ 30",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      subtitle: Text("5"),
    ); // ListTile
  }
}
