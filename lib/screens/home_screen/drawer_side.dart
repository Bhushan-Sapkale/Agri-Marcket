
import 'package:agri_market/config/colors.dart';
import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:agri_market/screens/my_profile/my_profile.dart';
import 'package:agri_market/screens/review_cart/review_cart.dart';
import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget{
  Widget listTile ({required String title, required IconData iconData,required Function() onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        color: Color(0xFFD4FBD8),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor:Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(height: 7,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {} ,
                          child: Text("Login"),
                          //shape 4 lin e code reaminining

                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            listTile(iconData:Icons.home_outlined, title: "Home",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );

                }
            ),
            listTile(iconData:Icons.shop_outlined, title: "Review Cart",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );

                }),
            listTile(iconData:Icons.person_outlined, title: "My Profile",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }
            ),
            listTile(iconData:Icons.notification_add_outlined, title: "Notification",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }),
            listTile(iconData:Icons.star_outlined, title: "Rating & Review",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }),
            listTile(iconData:Icons.favorite_outlined, title: "WishList",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }),
            listTile(iconData:Icons.copy_outlined, title: "Raise a Complaint",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }),
            listTile(iconData:Icons.format_quote_outlined, title: "FAQs",
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(

                      ),
                    ),
                  );

                }),


            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(" Call Us:"),
                      SizedBox( height: 10,
                      ),
                      Text("+917448058569"),
                    ],
                  ),
                  SizedBox( height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(" Mail Us:"),
                        SizedBox( height: 10,
                        ),
                        Text(" lipaneprajkta@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}