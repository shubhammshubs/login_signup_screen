

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_screen/Home_Screen.dart';

TextField reusableTextField(String text,IconData icon, bool isPasswordType ,TextEditingController controller ) {
  return TextField(controller: controller,
  obscureText: isPasswordType ,
  enableSuggestions: !isPasswordType,
  autocorrect: !isPasswordType,
  cursorColor: Colors.white,
  style: TextStyle(color: Colors.black54.withOpacity(0.9)),
  decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.grey.shade100 ,),
  labelText: text,
  labelStyle: TextStyle(color: Colors.white70.withOpacity(0.9)),
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: Colors.black.withOpacity(0.3),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
  ),
  keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}


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


Container signInSignUpButton (
BuildContext context,  bool isLogin, Function onTap) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
      isLogin ? 'Log In' : 'Sign Up'
      ,style: TextStyle(
            color: Colors.grey,
            fontSize: 27,fontWeight: FontWeight.w700
        ),),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: IconButton(
            color: Colors.white,
            onPressed: (){
              onTap();
              // Fluttertoast.showToast(msg: "Sign In Button Pressed");
            },
            icon: Icon(Icons.arrow_forward),
          ),
        )
      ],
    ),
  );
}