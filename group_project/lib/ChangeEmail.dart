import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPage();
}

class _ChangeEmailPage extends State<ChangeEmailPage> {
  String? newEmail;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text("Settings")
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                    label: Text("New Email",),
                    hintText: "Enter new email"
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
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Changed Email",
                              style: TextStyle(fontSize: 15),
                            )
                        ),
                    );
                    Navigator.pop(context, newEmail);
                  },
                  child: Text('Confirm',style: TextStyle(fontSize: 20,color: Colors.black)),
              ),
            ]
        ),
      ),
    );
  }
}
