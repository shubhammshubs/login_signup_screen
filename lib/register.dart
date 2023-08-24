import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_screen/Home_Screen.dart';
import 'package:login_signup_screen/reusables/reusable_widgets.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35,top: 130),
              child: Text('Create\nAccount',style: TextStyle(
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
                    reusableTextField("Enter User Name", Icons.person_2_outlined, false, _userNameTextController),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       hintText: 'Name',
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 30,),
                    reusableTextField("Enter Email Id", Icons.email, false, _emailTextController),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       hintText: 'Email',
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 30,),
                    reusableTextField("Enter The Password", Icons.lock_outline, true, _passwordTextController),

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
                    signInSignUpButton(context, false, () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) => {
                            Fluttertoast.showToast(msg: "SigUp Successful"),
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Screen())),
                      }).onError((error, stackTrace) => {
                        Fluttertoast.showToast(msg: "Error ${error.toString()}")});

                    }),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Sign Up',style: TextStyle(
                    //         color: Colors.grey,
                    //         fontSize: 27,fontWeight: FontWeight.w700
                    //     ),),
                    //     CircleAvatar(
                    //       radius: 30,
                    //       backgroundColor: Colors.grey,
                    //       child: IconButton(
                    //         color: Colors.white,
                    //         onPressed: (){
                    //           // FirebaseAuth.instance.createUserWithEmailAndPassword(email: , password: password)
                    //           Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) => Home_Screen()));
                    //         },
                    //         icon: Icon(Icons.arrow_forward),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 40,),

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
