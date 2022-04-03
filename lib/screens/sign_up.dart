


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hoguhlinker_app/main.dart';
import 'package:hoguhlinker_app/screens/home/details/components/home_screen.dart';
import 'package:hoguhlinker_app/screens/sign_in.dart';


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  static const String idScreen = "register";
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full-Name",
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
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone Number",
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
                   

                    if (nameTextEditingController.text.length < 3) {
                      displayToastMessage(
                          "Name must be atleast three characters", context);
                    } else if (!emailTextEditingController.text.contains("@")) {
                      displayToastMessage("Email is not valid", context);
                    } else if (phoneTextEditingController.text.isEmpty) {
                      displayToastMessage("Please enter phone number", context);
                    } else if (passwordTextEditingController.text.length < 6) {
                      displayToastMessage(
                          "Password must be atleast six", context);
                    }

                    registerNewUser(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 50)),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.idScreen, (route) => false);
                  },
                  child: Text("Already have an account? Sign in here"),
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
  void registerNewUser(BuildContext context) async {
    final User? firebaseUser =
        (await _firebaseAuth.createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text))
            .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        "name": nameTextEditingController.text,
        "email": emailTextEditingController.text,
        "phone": phoneTextEditingController.text,
        "password": passwordTextEditingController.text
      };

      usersRef.child(firebaseUser.uid).set(userDataMap);
      

      displayToastMessage(
          "Congratulations account has been created succesfully", context);

          Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.idScreen, (route) => false);
    } else {
      displayToastMessage("Error Account has not been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
