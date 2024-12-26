import 'package:agri_market/providers/user_provider.dart';
import 'package:agri_market/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
  bool isLoading = false;

  Future<void> _googleSignUp() async {
    setState(() {
      isLoading = true;
    });
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final User? user = await googleSignIn.signIn().then((googleUser) async {
        if (googleUser == null) return null; // User canceled sign-in
        final googleAuth = await googleUser.authentication;
        return (await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        ))
            .user;
      });

      if (user != null) {
        userProvider.addUserData(
          currentUser: user,
          userName: user.displayName ?? '',
          userEmail: user.email ?? '',
          userImage: user.photoURL ?? '',
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg.jpg'),
              ),
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
                      Text(
                        'Sign in to Continue',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Agri Market',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.greenAccent.shade700,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SignInButton(
                            Buttons.Google,
                            text: "Sign in with Google",
                            onPressed: () {
                              _googleSignUp();
                            },
                          ),
                          SignInButton(
                            Buttons.Apple,
                            text: "Sign in with Apple",
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Apple Sign-In is not implemented.'),
                                ),
                              );
                            },
                          ),
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
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
