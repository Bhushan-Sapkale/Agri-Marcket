import 'package:agri_market/config/colors.dart';
import 'package:agri_market/providers/check_out_provider.dart';
import 'package:agri_market/providers/product_provider.dart';
import 'package:agri_market/providers/review_cart_provider.dart';
import 'package:agri_market/providers/user_provider.dart';
import 'package:agri_market/providers/wish_list_provider.dart';
import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<ProductProvider>(
    create: (context)=> ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context)=> UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context)=> ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context)=> WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context)=> CheckoutProvider(),
        )
      ],

      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return HomeScreen();
            }
            return SignIn();
          },
        ),
      ),
    );
  }
}

