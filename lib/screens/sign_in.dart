


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hoguhlinker_app/main.dart';
import 'package:hoguhlinker_app/screens/home/details/components/home_screen.dart';
import 'package:hoguhlinker_app/screens/sign_up.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  static const String idScreen = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  "Sign-up or Sign in",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400),
                ),
                Align(
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 45.0,
                ),
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                TextField(
                  controller: passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                ElevatedButton(
                  onPressed: () {
                   


                        if (!emailTextEditingController.text.contains("@")) {
                      displayToastMessage("Email is not valid", context);
                    }else if (passwordTextEditingController.text.isEmpty) {
                      displayToastMessage(
                          "Enter password", context);
                    }


                        loginAndAuthenticateUser(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 50)),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RegistrationScreen.idScreen, (route) => false);
                  },
                  child: Text("Do not have an account? Register here"),
                  style: TextButton.styleFrom(primary: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User? firebaseUser =
        (await _firebaseAuth.signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text))
            .user;

    if (firebaseUser != null) {
      

      usersRef.child(firebaseUser.uid).once().then((Event) {
        final DataSnapshot = Event.snapshot;

        if (DataSnapshot != null) {
           Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.idScreen, (route) => false);

            displayToastMessage(
          "Congratulations Logged in succesfully", context);
        }
       
      });

      
    } else {
      displayToastMessage("Error Occured", context);
    }
  }


displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
}
