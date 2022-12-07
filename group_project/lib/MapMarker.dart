import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class MapMarker {
  String? username;
  LatLng? location;
  int? rating;
  DocumentReference? reference;

  MapMarker({this.username,this.location,this.rating});


  MapMarker.fromMap(var map, {this.reference}){
    this.username = map['Username'];
    this.location = map['Location'];
    this.rating = map['Rating'];
  }

  // final mapMarkers = [
  //   MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 3),
  //   MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 4),
  // ];

}