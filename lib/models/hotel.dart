class Hotel {
  String imageUrl;
  String address, reviews;
  String description;
  double price ;
  
  int bedRooms;
  int bathRooms;
  int phone;
  double sqFeet;
  int garages;
  int time;
  List<String> moreImagesUrl;
  bool isFav;

  Hotel({
    required this.imageUrl,
    required this.address,
    required this.description,
    required this.price,
    required this.bathRooms,
    required this.bedRooms,
    required this.sqFeet,
    required this.garages,
    required this.time,
    required this.moreImagesUrl,
    required this.isFav, 
    required this.reviews ,
    required this.phone 
  });
}
