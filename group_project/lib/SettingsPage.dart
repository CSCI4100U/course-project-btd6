import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_project/settings_interface.dart';


import 'ChangeEmail.dart';
import 'account.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.user});

  final String user;

  @override
  State<SettingsPage> createState() => _SettingsPageState(user: user);
}

class _SettingsPageState extends State<SettingsPage> {

  final String user;
  final local = SettingInterface();
  Acc? current;
  // var _insVal;
  // final local = SettingInterface();
  // final String username = "fuck you riley";
  // var current;
  _SettingsPageState({
    Key? key,
    required this.user,
  });

  @override
  void initState(){
    // Acc dev = new Acc(username: 'dev_admin', color: 'red', password: 'e', email: 'dev_email@gmail.com');
    // local.createAcc(dev);
    current = Acc(username: "loading", password: "loading", email: "loading", color: "loading");
    _getAcc();
    setState(() {
      const oneSecond = const Duration(seconds: 1);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });
  }

  Future _getAcc() async{
    List<Acc> acc = await local.getAllAccs();
    for (Acc ac in acc){
      if (ac.username == user){
        print("Found ${ac.username}");
        current = ac;
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text("Settings")
      ),
      body: FittedBox(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    children: [
                      Text('Username:   ${current!.username}',style: TextStyle(fontSize: 20,color: Colors.black)),
                    ]
                ),
                TextButton(
                    onPressed: (){
                      String temp = user;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChangeEmailPage(user: user)
                      )).whenComplete(() => _getAcc());;
                      },
                    child: Row(
                      children: [
                        Text('Email:    ${current!.email}   ',style: TextStyle(fontSize: 20,color: Colors.black)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 15),
                      ],
                    )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
