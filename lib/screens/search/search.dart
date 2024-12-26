import 'package:agri_market/models/product_model.dart';
import 'package:agri_market/widgets/single_item.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;

  Search({this.search = const []});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  List<ProductModel> searchItem(String query) {
    if (query.isEmpty) {
      return widget.search;
    }
    return widget.search.where((element) {
      return element.productName.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Color(0xFF71F377),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: "Search for items in the store",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Search Results
          _searchItem.isEmpty
              ? Center(
            child: Text(
              "No items found!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
              : Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productId: data.productId,
                productQuantity: data.productQuantity,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
