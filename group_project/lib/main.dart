import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'Map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            print("Error initializing Firebase");
          }
          if (snapshot.connectionState == ConnectionState.done){
            print ("Successfully connected to Firebase");
            return MaterialApp(
              title: "Cloud Storage",
              theme: ThemeData(
                  primarySwatch: Colors.blueGrey
              ),
              home: MyHomePage(title: "Cloud Storage"),
            );
          }
          else{
            return CircularProgressIndicator();
          }
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MapMainScreen();
}


