import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;
  // DocumentReference? reference;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });

  // Product.fromMap(var map, {this.reference}){
  //   this.image = map['image'];
  //   this.title = map['title'];
  //   this.address = map['address'];
  //   this.location = map['location'];
  //   this.rating = map['rating'];
  // }
  //
  // Map<String,Object?> toMap(){
  //   return {
  //     'image': this.image,
  //     'title': this.title,
  //     'address': this.address,
  //     'location': this.location,
  //     'rating': this.rating,
  //   };
  // }
}

final mapMarkers = [
  MapMarker(
      image: 'assets/images/restaurant_1.jpg',
      title: "Osmow's Shawarma",
      address: '1900 Simcoe St N Unit 103, Oshawa ON L1G4Y3, Canada',
      location: LatLng(43.9434, -78.8907),
      rating: 4
  ),
  MapMarker(
      image: 'assets/images/restaurant_1.jpg',
      title: "Subway",
      address: '2069 Simcoe St N, Oshawa ON L1H 1G6, Canada',
      location: LatLng(43.9477,-78.8951),
      rating: 3
  ),

];
