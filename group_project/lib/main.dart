import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Map.dart';


import 'Map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if (snapshot.hasError){
          print("Error connecting to Firebase");
        }
        if (snapshot.connectionState == ConnectionState.done){
          print("Successfully connect to Firebase");
          return MaterialApp(
            title: "Group Project",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'group project')
          );
        }else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.user});

  final String title;
  final String? user;

  @override
  State<MyHomePage> createState() => MapMainScreen();
}


