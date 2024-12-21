import 'package:agri_market/config/colors.dart';
import 'package:agri_market/screens/home_screen/drawer_side.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ), // Divider
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_drop_down),
        ), // ListTile
      ],
    ); // Column
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ), // TextStyle
        ), // Text
      ), // AppBar
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ), // Container
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ), // BorderRadius
                ), // BoxDecoration
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shraddha Pawar",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ), // TextStyle
                                  ), // Text
                                  SizedBox(
                                    height: 10,
                                  ), // SizedBox
                                  Text("assarbaloch5@gmail.com"),
                                ],
                              ), // Column
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ), // Icon
                                  backgroundColor: scaffoldBackgroundColor,
                                ), // CircleAvatar
                              ), // CircleAvatar
                            ],
                          ), // Row
                        ), // Container
                      ],
                    ), // Row
                    listTile(
                      icon: Icons.shop_outlined,
                      title: "My Orders",
                    ),
                    listTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),
                    listTile(
                      icon: Icons.person_outline,
                      title: "Refer A Friend",
                    ),
                    listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions",
                    ),
                    listTile(
                      icon: Icons.policy_outlined,
                      title: "Privacy Policy",
                    ),
                    listTile(
                      icon: Icons.add_chart,
                      title: "About",
                    ),
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: primaryColor,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://s3.envato.com/files/328957910/vegi_thumb.png",
                          ), // NetworkImage
                          radius: 45,
                          backgroundColor: scaffoldBackgroundColor,
                        ), // CircleAvatar
                      ), // CircleAvatar
                    ), // Padding
                  ],
                ), // ListView
              ), // Container
            ],
          ), // Column
        ],
      ), // Stack
    ); // Scaffold
  }
}