class ProductModel{
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int? productQuantity;
  //List<dynamic>productUnit;
  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
    this.productQuantity,
   //required this.productUnit
  });
}
