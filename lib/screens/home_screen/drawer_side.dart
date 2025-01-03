import 'package:agri_market/auth/sign_in.dart';
import 'package:agri_market/config/colors.dart';
import 'package:agri_market/providers/user_provider.dart';
import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:agri_market/screens/my_profile/my_profile.dart';
import 'package:agri_market/screens/review_cart/review_cart.dart';
import 'package:agri_market/screens/wish_list/wish_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerSide extends StatefulWidget {
  final UserProvider userProvider;
  DrawerSide({required this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({
    required String title,
    required IconData iconData,
    required Function() onTap,
  }) {
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
    var userData = widget.userProvider.currentUserData;

    return Drawer(
      child: Container(
        color: Color(0xFFD4FBD8),
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(userData.userImage),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 7),
                        Container(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () async {
                              // Log out user when the button is pressed
                              await FirebaseAuth.instance.signOut();
                              // Navigate to the SignIn screen after logging out
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
                            },
                            child: Text("LogOut"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.notification_add_outlined,
              title: "Notification",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.star_outlined,
              title: "Rating & Review",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.favorite_outlined,
              title: "WishList",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishList(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.copy_outlined,
              title: "Raise a Complaint",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.format_quote_outlined,
              title: "FAQs",
              onTap: () {},
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Call Us:"),
                      SizedBox(width: 5),
                      Text("+917448058569"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Mail Us:"),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          "lipaneprajkta@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:agri_market/config/colors.dart';
// import 'package:agri_market/providers/user_provider.dart';
// import 'package:agri_market/screens/home_screen/home_screen.dart';
// import 'package:agri_market/screens/my_profile/my_profile.dart';
// import 'package:agri_market/screens/review_cart/review_cart.dart';
// import 'package:agri_market/screens/wish_list/wish_list.dart';
// import 'package:flutter/material.dart';
//
// class DrawerSide extends StatefulWidget{
//
//   UserProvider userProvider;
//   DrawerSide({ required this.userProvider});
//
//   @override
//   State<DrawerSide> createState() => _DrawerSideState();
// }
//
// class _DrawerSideState extends State<DrawerSide> {
//   Widget listTile ({required String title, required IconData iconData,required Function() onTap}){
//     return ListTile(
//       onTap: onTap,
//       leading: Icon(
//         iconData,
//         size: 32,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(color: textColor),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // TODO: implement build
//     var userData = widget.userProvider.currentUserData;
//
//     return Drawer(
//       child: Container(
//         color: Color(0xFFD4FBD8),
//         child: ListView(
//           children: [
//             DrawerHeader(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor:Colors.white54,
//                       radius: 43,
//                       child: CircleAvatar(
//                         radius: 40,
//                         backgroundColor: Colors.yellow,
//                         backgroundImage: NetworkImage(
//                             userData.userImage
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           userData.userName,
//                         ),
//                         Text(userData.userEmail,overflow: TextOverflow.ellipsis,),
//                         SizedBox(height: 7,
//                         ),
//                         Container(
//                           height: 30,
//                           child: OutlinedButton(
//                             onPressed: () {} ,
//                             child: Text("Login"),
//                             //shape 4 lin e code reaminining
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             listTile(iconData:Icons.home_outlined, title: "Home",
//                 onTap: (){
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => HomeScreen(),
//                     ),
//                   );
//                 }),
//             listTile(iconData:Icons.shop_outlined, title: "Review Cart",
//                 onTap: (){
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ReviewCart(),
//                     ),
//                   );
//                 }),
//             listTile(iconData:Icons.person_outlined, title: "My Profile",
//                 onTap: (){
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => MyProfile(userProvider:widget.userProvider),
//                     ),
//                   );
//             }),
//             listTile(iconData:Icons.notification_add_outlined, title: "Notification",
//                 onTap: (){
//
//                 }),
//             listTile(iconData:Icons.star_outlined, title: "Rating & Review",
//                 onTap: (){
//
//                 }),
//             listTile(iconData:Icons.favorite_outlined, title: "WishList",
//                 onTap: (){
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => WishList(),
//                     ),
//                   );
//                 }),
//             listTile(iconData:Icons.copy_outlined, title: "Raise a Complaint",
//                 onTap: (){
//
//                 }),
//             listTile(iconData:Icons.format_quote_outlined, title: "FAQs",
//                 onTap: (){
//                 }),
//
//
//             Container(
//               height: 350,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Contact Support"),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(" Call Us:"),
//                       SizedBox( height: 10,
//                       ),
//                       Text("+917448058569"),
//                     ],
//                   ),
//                   SizedBox( height: 5,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Text(" Mail Us:"),
//                         SizedBox( height: 10,
//                         ),
//                         Text(" lipaneprajkta@gmail.com"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }