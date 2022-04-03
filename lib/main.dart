import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoguhlinker_app/constants/constants.dart';
import 'package:hoguhlinker_app/screens/home/details/components/home_screen.dart';
import 'package:hoguhlinker_app/screens/sign_in.dart';
import 'package:hoguhlinker_app/screens/sign_up.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: white
      ),
      home: LoginScreen(),
      routes: {
       HomeScreen.idScreen:(context) => HomeScreen(),
        RegistrationScreen.idScreen:(context) => RegistrationScreen(),
        LoginScreen.idScreen:(context) => LoginScreen()
        //Houses.idScreen:(context) => Houses()
      },
    );
  }
}
