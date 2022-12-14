import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:group_project/Graphs.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'AddNewRatingInfo.dart';
import 'DataTable.dart';
import 'SettingsPage.dart';
import 'marker_interface.dart';
import 'settings_interface.dart';
import 'MapMarker.dart';
import 'constants.dart';
import 'main.dart';
import 'account.dart';
import 'ratingNotification.dart';
import 'package:latlong2/latlong.dart';


class MapMainScreen extends State<MyHomePage> {
  final String user;

  MapMainScreen({
    Key? key,
    required this.user,
  });

  final pageController = PageController();
  final local = SettingInterface();
  final markerdb = MarkerInterface();
  // calling notification class
  final _notifications = Notifications();


  int selectedIndex = 0;

  // vairiables for notification
  String? notifTitle = "Location Rating";
  LatLng? notifAddress = MapMarker().location;
  Int? notifRating = MapMarker().rating as Int?;
  String? notifPayload = "This is the payload xd";
  var mapMarkers;

  @override
  void initState(){
    print(user);
    // Acc dev = new Acc(username: 'dev_admin', color: 'red', password: 'e', email: 'dev_email@gmail.com');
    // local.createAcc(dev);
    // _listAccs();

    MapMarker test = MapMarker(username:"devtest07",latitude:43.9466,longitude:-78.8978,rating:1);
    markerdb.createMarker(test);
    _listMarkers();

  }

  Future _listAccs() async{
    List<Acc> acc = await local.getAllAccs();
    print('');
    print('Accounts:');
    for (Acc ac in acc){
      print(ac);
    }
  }

  Future _listMarkers() async{
    List<MapMarker> m = await markerdb.getAllMarker();
    print('');
    print('Markers:');
    for (MapMarker map in m){
      print(map);
    }
  }

  Future _retMarkers() async{
    List<MapMarker> m = await markerdb.getAllMarker();
    mapMarkers = m;
  }

  Future getMarkers() async{
    print("Retrieving Marker DB");
    // return await FirebaseFirestore.instance.collection('Posts').get();
  }

  //_notifications.init();

  Widget _getMarkers(BuildContext context){
    return FutureBuilder(
        future: getMarkers(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print("snapshot $snapshot");
          if (!snapshot.hasData){
            print("Data is missing");
            return const CircularProgressIndicator();
          }else{
            print("found data");
            return _MapOutput(context);
          }
        }
    );
  }

  Widget _MapOutput(BuildContext context){
    _retMarkers();

    _notifications.init();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 32, 32),
          title: Text(FlutterI18n.translate(context, "map.title")),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Data(Locations: mapMarkers),
                      )
                  );
                },
                icon: const Icon(Icons.insert_chart, color: Colors.white,)
            ),
            IconButton(
                onPressed: () async {
                  var r = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddRating(),
                  ));
                  Position temp = await Geolocator.getCurrentPosition();
                  MapMarker insert = MapMarker(username: user, latitude: temp.latitude, longitude: temp.longitude, rating: r);
                  markerdb.createMarker(insert);
                },
                icon: const Icon(Icons.add, color: Colors.white,)
            ),
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(user: user)
                  ));
                },
                icon: const Icon(Icons.settings, color: Colors.white,)
            ),
          ]
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: AppConstants.myLocation,
            ),
            layers: [


              TileLayerOptions(
                urlTemplate:
                'https://api.mapbox.com/styles/v1/j6k3/clac55ccr000z15pepq9uy82q/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiajZrMyIsImEiOiJjbGFjNGI4MmIwNm85M3BvZm56eHBwZHN6In0.p86JDqoVLSTffvlEIpZhNw',
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 70,
                      width: 70,
                      point: mapMarkers[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              pageController.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                              selectedIndex = i;
                            });
                          },

                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.75,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.75,
                              child:Icon(
                                Icons.location_pin,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                  var currentLocation =
                      mapMarkers[value].location ?? AppConstants.myLocation;
                  //_animatedMapMove(currentLocation, 11.5);
                });

              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 30, 29, 29),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.rating,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.username ?? '',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.rating.toString() ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Icon(Icons.ac_unit, color: Colors.cyanAccent, size: 150,),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    Geolocator.isLocationServiceEnabled().then((value) => null);
    Geolocator.requestPermission().then((value) => null);
    Geolocator.checkPermission().then(
            (LocationPermission permission)
        {
          print("Check Location Permission: $permission");
        }
    );

    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
          accuracy: LocationAccuracy.best
      ),
    );

    print("test");

    return _MapOutput(context);

  }

// Future getGrades() async{
//   print("Getting the grades...");
//   print(await FirebaseFirestore.instance.collection('Locations').get());
//   return await FirebaseFirestore.instance.collection('Locations').get();
// }
//
// Future _addToDb(data) async{
//   FirebaseFirestore.instance.collection('Locations').doc().set(data);
//   setState(() {
//     print("Added data: $data");
//   });
// }


}