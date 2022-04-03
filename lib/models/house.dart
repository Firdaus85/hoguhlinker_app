class House {
  String imageUrl;
  String address, reviews;
  String description;
  double price ;
  
  int bedRooms;
  int phone;
  int bathRooms;
  double sqFeet;
  int garages;
  int time;
  List<String> moreImagesUrl;
  bool isFav;

  House({
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
