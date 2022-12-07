import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';

class MapMarker {
  String? username;
  double? longitude;
  double? latitude;
  LatLng? location;
  int? rating;
  int? reference;

  MapMarker({this.username,this.longitude,this.latitude,this.rating});


  MapMarker.fromMap(var map, {this.reference}){
    this.username = map['username'];
    this.longitude = map['longitude'];
    this.latitude = map['latitude'];
    this.location = LatLng(map['latitude'], map['longitude']);
    this.rating = map['rating'];
    this.reference = map['id'];
  }

  Map<String, Object?> toMap(){
    return {
      'username': this.username,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'rating': this.rating,
      'id': Random().nextInt(10000)
    };
  }

  String toString(){
    return '($username), Latitude: $latitude, Longitude: $longitude, Rating: $rating';
  }

  // final mapMarkers = [
  //   MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 3),
  //   MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 4),
  // ];

}