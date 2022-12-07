import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_project/settings_interface.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Map.dart';
import 'account.dart';
import 'accountCreationPage.dart';
import 'main.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _username;
  String? _password;
  String? _user;
  bool islogin = false;
  final local = SettingInterface();


  void initState(){
    setState(() {
      const oneSecond = Duration(seconds: 1);
      // new Timer.periodic(oneSecond, (Timer t) => setState(() {
      //
      // }));
    });
  }

  Future queryLocal(String? u, String? p) async {
    List<Acc> acc = await local.getAllAccs();
    print("accounts fetched");
    for (Acc ac in acc){
      if(_username! == ac.username! && _password! == ac.password!){
        print("account found");
        _user = _username;
        islogin = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "login.login"),
            style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: InputDecoration(
                    label: Text(FlutterI18n.translate(context, "login.username")),
                    hintText: FlutterI18n.translate(context, "login.username")
                ),
                onChanged: (value){
                  _username = value;
                },
              ),
              TextField(
                obscureText: true,
                style: const TextStyle(fontSize: 30),
                decoration: InputDecoration(
                    label: Text(FlutterI18n.translate(context, "login.password")),
                    hintText: FlutterI18n.translate(context, "login.password")
                ),
                onChanged: (value){
                  _password = value;
                },
              ),
              TextButton(
                onPressed: () {
                  queryLocal(_username, _password);
                  if(islogin == true){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "map", user: _user!)
                    ));
                  }



                },
                child: Text(FlutterI18n.translate(context, "login.login")),
                //check sqLite if userName and password match
                //if they do, go to main map page
                //if they dont, maybe add snack bar thing saying its wrong
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const accountPage()
                  ));
                },
                child: Text(FlutterI18n.translate(context, "login.account")),
                //go to account creation page using navigator
              ),
            ],
          ),
        ),
    );
  }

}
