import 'package:flutter/material.dart';
import 'package:hoguhlinker_app/constants/constants.dart';
import 'package:hoguhlinker_app/models/hotel.dart';
import 'package:hoguhlinker_app/screens/home/details/components/hotels.dart';
import 'package:hoguhlinker_app/screens/home/details/components/houses.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(158, 119, 119, 119),
                ),
                child: TabBar(
                  
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: darkBlue),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Hotel",
                           
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Guesthouse"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Hotels(),
                Houses(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
