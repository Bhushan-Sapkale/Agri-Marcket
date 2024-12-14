import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
 //  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

