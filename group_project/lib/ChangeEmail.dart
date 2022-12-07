import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_project/settings_interface.dart';
import 'package:flutter_i18n/flutter_i18n.dart';


import 'account.dart';


class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key, required this.user});

  final String user;

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPage(user: user);
}

class _ChangeEmailPage extends State<ChangeEmailPage> {

  final String user;
  String? newEmail;
  final local = SettingInterface();
  Acc? current;

  _ChangeEmailPage({
    Key? key,
    required this.user,
  });

  Future _getAcc() async{
    List<Acc> acc = await local.getAllAccs();
    for (Acc ac in acc){
      if (ac.username == user){
        print("Found ${ac.username}");
        current = ac;
      }
    }
  }

  Future updateEmail() async{
    await _getAcc();
    print("next");
    Acc temp = Acc(username: current?.username, password: current?.password, email: newEmail, color: current?.color);
    local.updateAcc(temp);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "changeEmail.settings"))
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: InputDecoration(
                    label: Text(FlutterI18n.translate(context, "changeEmail.newEmail")),
                    hintText: FlutterI18n.translate(context, "changeEmail.newEmailHint"),
                ),
                onChanged: (value){
                  newEmail = value;
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                  onPressed: (){

                    updateEmail();

                    ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                            content: Text(FlutterI18n.translate(context, "changeEmail.changedEmail"),
                              style: TextStyle(fontSize: 15),
                            )
                        ),
                    );
                  },
                  child: Text(FlutterI18n.translate(context, "changeEmail.confirm"),
                      style: TextStyle(fontSize: 20,color: Colors.black)),
              ),
            ]
        ),
      ),
    );
  }
}
