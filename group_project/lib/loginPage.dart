import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _todoItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login", style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                    label: Text("Username",),
                    hintText: "Enter username"
                ),
                onChanged: (value){
                  _todoItem = value;
                },
              ),
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                    label: Text("Password",),
                    hintText: "Enter password"
                ),
                onChanged: (value){
                  _todoItem = value;
                },
              ),
              TextButton(
                onPressed: () { },
                child: const Text('Login'),
                //check sqLite if userName and password match
                //if they do, go to main map page
                //if they dont, maybe add snack bar thing saying its wrong
              ),
              TextButton(
                onPressed: () { },
                child: const Text('Create Account'),
                //go to account creation page using navigator
              ),
            ],
          ),
        ),
    );
  }

}
