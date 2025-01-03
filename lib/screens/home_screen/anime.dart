import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Anime extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Lottie.asset(
            'assets/orderplace.json',
            fit: BoxFit.contain,
        ),
      ),
    );
  }
}