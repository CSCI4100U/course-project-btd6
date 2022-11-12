import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate My Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Rate My Location'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://i.natgeofe.com/k/c41b4f59-181c-4747-ad20-ef69987c8d59/eiffel-tower-night_2x3.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration:  const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black87,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
          actions: const [
            Icon(Icons.account_circle_rounded)
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          /*decoration: BoxDecoration(
             border: Border.all(
                 width: 4,
                 color: Colors.black,
                 style: BorderStyle.solid
             ),
             borderRadius: BorderRadius.circular(10),
           ),*/
          child: const Text(
            'Rate My Location',
            style: TextStyle(
                fontSize: 50,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

class backGroundLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.natgeofe.com/k/c41b4f59-181c-4747-ad20-ef69987c8d59/eiffel-tower-night_2x3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

