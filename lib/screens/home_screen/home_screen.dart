import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  Widget singleProduct(){
    return Container(
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
          Expanded(
              flex: 2,
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgz_fmY3F0uoTI-ov9yaE0dqNQ1xpNdZMRQA&s')
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Basil',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text('₹10/50 Gram',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),

                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text('50 gram',style: TextStyle(fontSize: 11),)),
                              Center(
                                child: Expanded(
                                  child: Icon(Icons.keyboard_double_arrow_down,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),

                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.remove,
                                size: 15,
                                color: Colors.lightGreen,),
                              Text('1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              Icon(Icons.add,
                                size: 15,
                                color: Colors.lightGreen,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFD4FBD8),
      drawer: Drawer(
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',style: TextStyle(color: Colors.black,
        )),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xFFB4F6B8),
            child: Icon(Icons.search_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
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


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Herbs Seasoning'),
                Text('View All',style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProduct(),
                singleProduct(),
                singleProduct(),
                singleProduct(),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Fruits'),
                Text('View All',style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProduct(),
                singleProduct(),
                singleProduct(),
                singleProduct(),


              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}