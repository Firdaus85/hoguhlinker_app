import 'package:flutter/material.dart';
import 'package:hoguhlinker_app/screens/home/details/components/bottom_buttons.dart';
import 'package:hoguhlinker_app/screens/home/details/components/categories.dart';
import 'package:hoguhlinker_app/screens/home/details/components/custom_app_bar.dart';
import 'package:hoguhlinker_app/screens/home/details/components/houses.dart';
import 'package:hoguhlinker_app/screens/home/details/components/tabScreen.dart';

class HomeScreen extends StatelessWidget {

  static const String idScreen = "homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              CustomAppBar(),
              //Categories(),
              Expanded(child: TabScreen()),
              
              //Houses(),
            ],
          ),
          
          //BottomButtonsHome(),
        ],
      ),
    );
  }
}
