import 'package:flutter/material.dart';
import 'package:hoguhlinker_app/models/hotel.dart';
import 'package:hoguhlinker_app/screens/home/details/components/bottom_buttons.dart';
//import 'package:hoguhlinker_app/models/house.dart';
//import 'package:hoguhlinker_app/screens/home/details/components/bottom_buttons.dart';
import 'package:hoguhlinker_app/screens/home/details/components/components/bottom_buttons.dart';
import 'package:hoguhlinker_app/screens/home/details/components/components/carousel_images.dart';
import 'package:hoguhlinker_app/screens/home/details/components/components/custom_app_bar.dart';
import 'package:hoguhlinker_app/screens/home/details/components/components/hotel_details.dart';
//import 'package:hoguhlinker_app/screens/home/details/components/components/house_details.dart';


class DetailsScreenHotel extends StatefulWidget {

  final Hotel hotel;

  const DetailsScreenHotel({ Key? key, required this.hotel}) : super(key: key);

  @override
  _DetailsScreenHotelState createState() => _DetailsScreenHotelState();
}

class _DetailsScreenHotelState extends State<DetailsScreenHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.hotel.moreImagesUrl),
                  CustomAppBar(),
                ],
              ),
              HotelDetails(widget.hotel),
            ],
          ),
          BottomButtonsHotelsDetails(hotel: widget.hotel,),
        ],
      ),
    );
  }
}
