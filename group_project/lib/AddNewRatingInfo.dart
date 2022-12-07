import 'package:flutter/material.dart';



class AddRating extends StatelessWidget {
  const AddRating({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Star", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(165, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FloatingActionButton(

              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: const Text('1 Star'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: const Text('2 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 3);
              },
              child: const Text('3 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 4);
              },
              child: const Text('4 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 5);
              },
              child: const Text('5 Stars'),
              //go to account creation page using navigator
            ),
          ],
        ),
      ),
    );
  }

}
