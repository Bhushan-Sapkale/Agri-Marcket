import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        print("Sign-In was canceled by the user.");
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print("Signed in ${user.displayName}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
body: Container(
  height: double.infinity,
  decoration: BoxDecoration(

    image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/bg.jpg')
    )
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 400,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Sign in to Continue'),
            Text('Agri Market',style: TextStyle(fontSize: 50,color: Colors.white,
                shadows: [
                  BoxShadow(
                  blurRadius: 5,
                    color: Colors.greenAccent.shade700,
                    offset: Offset(3, 3),
                ),],
            ),
            ),
            Column(
              children: [
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {
                    _googleSignUp().then((value)=> Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)=>HomeScreen(),),),);
                  },
                ),
                SignInButton(
                  Buttons.Apple,
                  text: "Sign in with Apple",
                  onPressed: () {},
                )
              ],
            ),
            Column(
              children: [
                Text('By Bhushan Sapkale'),
              ],
            ),

          ],
        ),
      ),
    ],
  ),
),);
  }
}