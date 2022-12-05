import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:group_project/Graphs.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'settings_interface.dart';
import 'MapMarker.dart';
import 'constants.dart';
import 'main.dart';
import 'account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  var _insVal;
  final local = SettingInterface();
  final username = "fuck you riley";
  var current;

  @override
  void initState(){
    // Acc dev = new Acc(username: 'dev_admin', color: 'red', password: 'e', email: 'dev_email@gmail.com');
    // local.createAcc(dev);

  }

  Future _getAcc() async{
    List<Acc> acc = await local.getAllAccs();
    for (Acc ac in acc){
      if (ac.username == 'username'){
        print("Found ${ac.username}");
        current = ac;
      }
    }
    // print('');
    // print('Accounts:');
    // for (Acc ac in acc){
    //   print(ac);
    // }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings")
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Username:'),
              Text(current.username),
            ]
          ),
          Row(
              children: [
                Text('Email:'),
                Text(current.email),
                IconButton(
                  onPressed: (){

                  }

                ),
              ]
          ),
        ]
      ),
    );
  }
}
