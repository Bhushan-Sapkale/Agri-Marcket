import 'package:agri_market/config/colors.dart';
import 'package:agri_market/screens/home_screen/drawer_side.dart';
import 'package:agri_market/screens/product_overview/product_overview.dart';
import 'package:agri_market/screens/search/search.dart';
import 'package:flutter/material.dart';

import 'single_product.dart';

class HomeScreen extends StatelessWidget{

  Widget _builderHerbsProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[

              Text('Grains and Pulses',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('View All',
                style: TextStyle(color: Colors.grey)
                ,),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Wheat',
                          productImage: 'https://tse3.mm.bing.net/th?id=OIP.BnzpcEoHZ6OB0U7nyfKNrwHaEi&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  },
                  productImage: 'https://tse3.mm.bing.net/th?id=OIP.BnzpcEoHZ6OB0U7nyfKNrwHaEi&pid=Api&P=0&h=180',
                  productName: 'Wheat',
                ),

                SingleProduct(productImage: 'https://www.lifeline-foods.com/wp-content/uploads/2018/11/corn-bowl3-01.png',
                    productName: 'Corn(Makka)',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                              productName: 'Basil2',
                              productImage: 'https://tse2.mm.bing.net/th?id=OIP.jZ8KKoHTdOAe-K3a_T0mhAAAAA&pid=Api&P=0&h=180'
                          ),
                        ),
                      );

                    }),

                SingleProduct(productImage: 'https://www.jainsuperbazar.in/pub/media/catalog/product/cache/4e4275a4460c398de857f28b0072ab4a/7/1/715_1.jpg',
                    productName: 'Bajra',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                            productName: 'Bajra',
                            productImage: 'https://www.jainsuperbazar.in/pub/media/catalog/product/cache/4e4275a4460c398de857f28b0072ab4a/7/1/715_1.jpg',

                          ),
                        ),
                      );
                    }),

                SingleProduct(productImage: 'https://smirks.com/wp-content/uploads/2021/01/Millet.jpg',
                    productName: 'Jawar',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                              productName: '',
                              productImage: "4"
                          ),
                        ),
                      );
                    }),
                SingleProduct(productImage: 'https://thumbs.dreamstime.com/b/chana-dal-organic-tur-dal-split-healthy-nutrition-bowl-white-background-ai-generative-chana-dal-organic-tur-dal-split-326148833.jpg',
                    productName: 'Split Chickpeas (Chana Dal)',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                            productImage: '',
                            productName: '5',
                          ),
                        ),
                      );
                    }),

                SingleProduct(productImage: 'https://img.lovepik.com/photo/20211118/medium/lovepik-fresh-lentil-in-wooden-bowl-on-white-background-picture_480016024.jpg',
                    productName: 'Red Lentils (Masoor Dal)',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                            productImage: 'https://tse2.mm.bing.net/th?id=OIP.jZ8KKoHTdOAe-K3a_T0mhAAAAA&pid=Api&P=0&h=180',
                            productName: '6',
                          ),
                        ),
                      );
                    }),

                SingleProduct(productImage: 'https://cpimg.tistatic.com/08114718/b/4/Toor-Dal.jpg',
                    productName: 'Pigeon peas (Toor Dal)',
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                            productImage: '',
                            productName: '7',
                          ),
                        ),
                      );
                    }),
              ],

            )
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
            children: const[

              Text('Fresh Fruits',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('View All',
                style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(productImage: 'https://tse3.mm.bing.net/th?id=OIP.s033-QYzCL3uKbRmhTmpPgHaE5&pid=Api&P=0&h=180',
                  productName: 'Guava',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                            productName: 'Guava',
                            productImage: "https://tse3.mm.bing.net/th?id=OIP.s033-QYzCL3uKbRmhTmpPgHaE5&pid=Api&P=0&h=180"
                        ),
                      ),
                    );
                  }),
              // https://tse3.mm.bing.net/th?id=OIP.s033-QYzCL3uKbRmhTmpPgHaE5&pid=Api&P=0&h=180
              // https://tse2.mm.bing.net/th?id=OIP.sfuypjo0o752YNSx4MaQ4AHaHa&pid=Api&P=0&h=180  Apple
              SingleProduct(productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                  productName: 'Oranges',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),

              SingleProduct(productImage: 'https://tse4.mm.bing.net/th?id=OIP.yiukCYe6mKEu7NeVsExUDgAAAA&pid=Api&P=0&h=180',
                  productName: 'Sweet Lime',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Sweet Lime',
                          productImage: 'https://tse4.mm.bing.net/th?id=OIP.yiukCYe6mKEu7NeVsExUDgAAAA&pid=Api&P=0&h=180',
                        ),
                      ),
                    );

                  }),

              SingleProduct(productImage: 'https://tse3.mm.bing.net/th?id=OIP.5CQquxENXhQB4PLDYMh79AHaF7&pid=Api&P=0&h=180',
                  productName: 'WaterMelon',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'WaterMelon',
                          productImage: 'https://tse3.mm.bing.net/th?id=OIP.5CQquxENXhQB4PLDYMh79AHaF7&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://tse3.mm.bing.net/th?id=OIP.wtOredZX0EbEC3CoXyASSwHaF_&pid=Api&P=0&h=180',
                  productName: 'Pomegranate',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Pomegranate',
                          productImage: 'https://tse3.mm.bing.net/th?id=OIP.wtOredZX0EbEC3CoXyASSwHaF_&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://tsexpstore.com/uploads/products/buy-kesar-mango.png',
                  productName: 'Mango',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Mango',
                          productImage: 'https://tsexpstore.com/uploads/products/buy-kesar-mango.png',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://purepng.com/public/uploads/large/purepng.com-custard-applesfruitscustard-applesugar-appleannonasweetsop-981525181016xp7zi.png',
                  productName: 'Custard Apple',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Custard Apple',
                          productImage: 'https://purepng.com/public/uploads/large/purepng.com-custard-applesfruitscustard-applesugar-appleannonasweetsop-981525181016xp7zi.png',
                        ),
                      ),
                    );
                  }),

            ],
          ),
        )
      ],
    );
  }

  Widget _builderVegetablesProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[

              Text('Fresh Vegatables',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('View All',
                style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(productImage: 'https://thumbs.dreamstime.com/b/spinach-14315379.jpg',
                  productName: 'Spinach',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Spinach',
                          productImage: 'https://thumbs.dreamstime.com/b/spinach-14315379.jpg',
                        ),
                      ),
                    );
                  }),

              SingleProduct(productImage: 'https://tse2.mm.bing.net/th?id=OIP._zosxU03HNiWGicygmvmMwHaFP&pid=Api&P=0&h=180',
                  productName: 'Tomato',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Tomato',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP._zosxU03HNiWGicygmvmMwHaFP&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),

              SingleProduct(productImage: 'https://tse4.mm.bing.net/th?id=OIP.ePQST0K4_MCf-7IVTyyoGwHaFa&pid=Api&P=0&h=180',
                  productName: 'Potato',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),

              SingleProduct(productImage: 'https://freepngimg.com/thumb/categories/2972.png',
                  productName: 'Cauliflower',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://tse4.mm.bing.net/th?id=OIP.zuBiiaTEZEe3r4HK3it9NAHaGz&pid=Api&P=0&h=180',
                  productName: 'Cabbage',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://tse3.mm.bing.net/th?id=OIP.fgGioXrDsRKWGJkYzlzLvAHaD4&pid=Api&P=0&h=180',
                  productName: 'Onion',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
              SingleProduct(productImage: 'https://tse4.mm.bing.net/th?id=OIP.VGyP5HeHXxYcn4v4qPU7egHaF7&pid=Api&P=0&h=180',
                  productName: 'Red Chillies',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Oranges',
                          productImage: 'https://tse2.mm.bing.net/th?id=OIP.O0rac6pL5HgNJGU7TqSGnwHaEO&pid=Api&P=0&h=180',
                        ),
                      ),
                    );
                  }),
            ],
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFD4FBD8),
      drawer: DrawerSide(),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(),),);
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
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFB4F6B8),
              child: Icon(Icons.shopping_cart,size: 18,color: Colors.black),
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

            _builderHerbsProduct(context),
            _builderFruitsProduct(context),
            _builderVegetablesProduct(context),

          ],
        ),
      ),
    );
  }
}