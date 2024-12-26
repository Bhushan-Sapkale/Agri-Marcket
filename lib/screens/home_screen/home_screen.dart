import 'package:agri_market/config/colors.dart';
import 'package:agri_market/providers/product_provider.dart';
import 'package:agri_market/providers/user_provider.dart';
import 'package:agri_market/screens/home_screen/drawer_side.dart';
import 'package:agri_market/screens/product_overview/product_overview.dart';
import 'package:agri_market/screens/review_cart/review_cart.dart';
import 'package:agri_market/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'single_product.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductProvider productProvider = ProductProvider();

  Widget _builderGrainsProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text('Grains and Pulses',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getGrainsProductDataList,
                      ),
                      ),
                  );
                },
                child: Text('View All',
                  style: TextStyle(color: Colors.grey)
                  ,),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getGrainsProductDataList.map((grainProductData) {
              return SingleProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productPrice: grainProductData.productPrice,
                        productName: grainProductData.productName,
                        productImage: grainProductData.productImage,
                        productId: grainProductData.productId,
                      ),
                    ),
                  );
                },
                productPrice: grainProductData.productPrice,
                productImage: grainProductData.productImage,
                productName: grainProductData.productName,
                productId: grainProductData.productId,
                productUnit: grainProductData,
              );
            }).toList(),
          ),
        ),

      ],
    );
  }

  Widget _builderFruitsProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text('Fresh Fruits',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFruitsProductDataList,
                      ),
                    ),
                  );
                },
                child: Text('View All',
                  style: TextStyle(color: Colors.grey)
                  ,),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFruitsProductDataList.map((fruitsProductData) {
              return SingleProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productPrice: fruitsProductData.productPrice,
                        productName: fruitsProductData.productName,
                        productImage: fruitsProductData.productImage,
                        productId: fruitsProductData.productId,
                      ),
                    ),
                  );
                },
                productPrice: fruitsProductData.productPrice,
                productImage: fruitsProductData.productImage,
                productName: fruitsProductData.productName,
                productId: fruitsProductData.productId,
                productUnit: fruitsProductData,
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _builderVegetablesProduct(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Fresh Vegatables',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getVegetablesProductDataList,
                      ),
                    ),
                  );
                },
                child: Text('View All',
                  style: TextStyle(color: Colors.grey)
                  ,),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getVegetablesProductDataList.map((vegetablesProductData) {
              return SingleProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productPrice: vegetablesProductData.productPrice,
                        productName: vegetablesProductData.productName,
                        productImage: vegetablesProductData.productImage,
                        productId: vegetablesProductData.productId,
                      ),
                    ),
                  );
                },
                productPrice: vegetablesProductData.productPrice,
                productImage: vegetablesProductData.productImage,
                productName: vegetablesProductData.productName,
                productId: vegetablesProductData.productId,
                productUnit: vegetablesProductData,
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget listTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title:Text(title,
        style:TextStyle(color:Colors.black45),
      ),
    );
  }
 @override
  void initState() {
    // TODO: implement initState
   ProductProvider productProvider = Provider.of(context,listen: false);
   productProvider.fetchGrainsProductData();
   productProvider.fetchFruitsProductData();
   productProvider.fetchVegetablesProductData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    productProvider = Provider.of(context,);

    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    return Scaffold(
      backgroundColor: Color(0xFFD4FBD8),
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',
            style: TextStyle(color: Colors.black,
            )),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFB4F6B8),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                  search: productProvider.getAllProductSearch,
                ),),);
              },
              icon: Icon(
                Icons.search_outlined,
                size: 18,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFB4F6B8),
                child: Icon(
                    Icons.shopping_cart,
                    size: 18,
                    color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFF71F377),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://t3.ftcdn.net/jpg/05/01/31/18/360_F_501311851_n4R0tBtxqalOqHPQcMMozHNI4qvA87fW.jpg'),
                ),
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 100,bottom: 10),
                              child: Container(
                                height: 47,
                                width: 109,
                                decoration: BoxDecoration(
                                    color: Color(0x4F00FF09),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    )
                                ),
                                child: Text(' Agri-Market',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3,3)
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Text(' All Fresh  Vegetables & Friuts',style: TextStyle(
                              fontSize: 22,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container(
                  ),
                  ),
                ],
              ),
            ),

             _builderGrainsProduct(context),
             _builderFruitsProduct(context),
             _builderVegetablesProduct(),

          ],
        ),
      ),
    );
  }
}