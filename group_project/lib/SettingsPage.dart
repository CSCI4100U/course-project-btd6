import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'ChangeColor.dart';
import 'ChangeEmail.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // var _insVal;
  // final local = SettingInterface();
  // final String username = "fuck you riley";
  // var current;

  @override
  void initState(){
    // Acc dev = new Acc(username: 'dev_admin', color: 'red', password: 'e', email: 'dev_email@gmail.com');
    // local.createAcc(dev);

  }

  Future _getAcc() async{
    // List<Acc> acc = await local.getAllAccs();
    // for (Acc ac in acc){
    //   if (ac.username == 'username'){
    //     print("Found ${ac.username}");
    //     current = ac;
    //   }
    // }
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
                      Text('Username:   current.username',style: TextStyle(fontSize: 20,color: Colors.black)),
                    ]
                ),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangeEmailPage()
                      ));
                      },
                    child: Row(
                      children: [
                        Text('Email:    current_email   ',style: TextStyle(fontSize: 20,color: Colors.black)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 15),
                      ],
                    )
                ),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangeColorPage()
                      ));
                      },
                    child: Row(
                      children: [
                        Text('Color:    current_color   ',style: TextStyle(fontSize: 20,color: Colors.black)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 12,)
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
