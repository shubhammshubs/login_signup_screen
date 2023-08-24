

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_screen/login.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value) => {
              Fluttertoast.showToast(msg: "Signed Out"),
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>MyLogin())),
            });

          },
        ),
      ),
    );
  }
}
