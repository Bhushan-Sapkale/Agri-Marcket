import 'package:agri_market/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
   late ProductModel productModel;

List<ProductModel>search=[];
  productModels(QueryDocumentSnapshot element){
    productModel = ProductModel(
    productImage: element.get("productImage"),
    productName: element.get("productName"),
    productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    //  productUnit: element.get("productUnit")
    );
    search.add(productModel);
  }


  /////////////////////////// GrainsProduct /////////////////////////


  List<ProductModel> grainsProductList = [];

  fetchGrainsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("GrainsProduct").get();

    value.docs.forEach((element) {
      productModels(element);  //function call
      newList.add(productModel);
    });

    grainsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getGrainsProductDataList {
    return grainsProductList;
  }


/////////////////////////// FruitsProduct /////////////////////////

  List<ProductModel> fruitsProductList = [];

  fetchFruitsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("FruitsProduct").get();

    value.docs.forEach((element) {
      productModels(element); //function call
      newList.add(productModel);
    });

    fruitsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFruitsProductDataList {
    return fruitsProductList;
  }

/////////////////////////// VegetablesProduct /////////////////////////


  List<ProductModel> vegetablesProductList = [];

  fetchVegetablesProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("VegetablesProduct").get();

    value.docs.forEach((element) {
      productModels(element);  //function call
      newList.add(productModel);
    });

    vegetablesProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getVegetablesProductDataList {
    return vegetablesProductList;
  }
/////////////////////// Search Appbar///////////////////////////

  List<ProductModel> get getAllProductSearch {
    return search;
  }

}
