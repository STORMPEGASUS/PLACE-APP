import 'package:flutter/foundation.dart';
import "dart:io"; //used for input output for the file system

class Placelocation{

  final double latitude;
  final double longitude;
  final String address;

  Placelocation({@required this.latitude,@required this.longitude,this.address});
}


class Place {
  final String id;
  final String title;
  final Placelocation location;
  final File image;  //file datatype for image 


  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
    });
}
