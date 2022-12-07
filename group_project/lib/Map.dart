import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:group_project/Graphs.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:group_project/views/HomePageDemo.dart';

import 'DataTable.dart';
import 'SettingsPage.dart';
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

  // calling notification class
  final _notifications = Notifications();


  int selectedIndex = 0;

  // vairiables for notification
  String? notifTitle = "Location Rating";
  LatLng? notifAddress = MapMarker().location;
  Int? notifRating = MapMarker().rating as Int?;
  String? notifPayload = "This is the payload xd";

  @override
  void initState(){
    print("made it to map.dart");
    // Acc dev = new Acc(username: 'dev_admin', color: 'red', password: 'e', email: 'dev_email@gmail.com');
    // local.createAcc(dev);
    // _listAccs();
  }

  Future _listAccs() async{
    List<Acc> acc = await local.getAllAccs();
    //_posts = posts;
    print('');
    print('Accounts:');
    for (Acc ac in acc){
      print(ac);
    }
  }

  Future getMarkers() async{
    print("Retrieving Marker DB");
    return await FirebaseFirestore.instance.collection('Posts').get();
  }

  //_notifications.init();

  Widget _getMarkers(BuildContext context){
    return FutureBuilder(
        future: getMarkers(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print("snapshot $snapshot");
          if (!snapshot.hasData){
            print("Data is missing");
            return CircularProgressIndicator();
          }else{
            print("found data");
            return _MapOutput(context);
          }
        }
    );
  }

  Widget _MapOutput(BuildContext context){
    var mapMarkers = [
      MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 3),
      MapMarker(username: "dev_admin_02", location: LatLng(43.9456, -78.8968), rating: 4),
    ];

    _notifications.init();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 32, 32),
          title: const Text('Location Rating'),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Data(Locations: mapMarkers),
                      )
                  );
                },
                icon: Icon(Icons.insert_chart, color: Colors.white,)
            ),
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.add, color: Colors.white,)
            ),
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(user: user)
                  ));
                },
                icon: Icon(Icons.settings, color: Colors.white,)
            ),
            IconButton(
                onPressed: _notificationNow,
                icon: Icon(Icons.notification_add, color: Colors.white,)
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
                              child: Icon(
                                Icons.ac_unit,
                                color: Colors.cyanAccent,
                                size: 150,),
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

  void _notificationNow() async{
    _notifications.sendNotifNow(
        "Rate My Location",
        "You rated $notifAddress: $notifRating stars!",
        "Payload");
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