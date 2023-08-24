import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_screen/Home_Screen.dart';
import 'package:login_signup_screen/reusables/reusable_widgets.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png')
            ,fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50,top: 130),
              child: Text('Welcome',style: TextStyle(
                color: Colors.red,
                fontSize: 33

              ),),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                right: 35,
                left: 35),
                child: Column(
                  children: [
                    reusableTextField("Enter UserName",Icons.person_outlined,false,_emailTextController),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.grey.shade100,
                    //     filled: true,
                    //     hintText: 'Email',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10)
                    //     )
                    //   ),
                    // ),
                    SizedBox(height: 30,),
                    reusableTextField("Enter the Password",Icons.lock_outlined,true,_passwordTextController),

                    // TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       hintText: 'Password',
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 40,),
                    signInSignUpButton(context, true, () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) => {
                            Fluttertoast.showToast(msg: "LogIn Successful"),
                            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Screen() )),
                      }).onError((error, stackTrace) => {
                        Fluttertoast.showToast(msg: "Error ${error.toString()}")});
                    }),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //       Text('Sign In',style: TextStyle(
                    //         color: Colors.grey,
                    //         fontSize: 27,fontWeight: FontWeight.w700
                    //       ),),
                    //     CircleAvatar(
                    //       radius: 30,
                    //       backgroundColor: Colors.grey,
                    //       child: IconButton(
                    //         color: Colors.white,
                    //         onPressed: (){
                    //           Fluttertoast.showToast(msg: "Sign In Button Pressed");
                    //           Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                    //         },
                    //         icon: Icon(Icons.arrow_forward),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        }, child: Text('Sign Up', style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.grey,
                        ),)),

                        TextButton(onPressed: () {Fluttertoast.showToast(msg: 'Forgot Password Button Pressed');},
                            child: Text('Forgot Password', style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.grey,
                        ),))

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
