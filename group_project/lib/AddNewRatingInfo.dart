import 'package:flutter/material.dart';
import 'ratingNotification.dart';


class AddRating extends StatelessWidget {
  AddRating({super.key});

  final _notifications = Notifications();

  Widget build(BuildContext context) {

    _notifications.init();

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
                _notifications.sendNotifNow(
                    "Rate My Location",
                    "You gave this location a 1 star rating!",
                    "Payload"
                );
              },
              child: const Text('1 Star'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 2);
                _notifications.sendNotifNow(
                    "Rate My Location",
                    "You gave this location a 2 star rating!",
                    "Payload"
                );
              },
              child: const Text('2 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 3);
                _notifications.sendNotifNow(
                    "Rate My Location",
                    "You gave this location a 3 star rating!",
                    "Payload"
                );
              },
              child: const Text('3 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 4);
                _notifications.sendNotifNow(
                    "Rate My Location",
                    "You gave this location a 4 star rating!",
                    "Payload"
                );
              },
              child: const Text('4 Stars'),
              //go to account creation page using navigator
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, 5);
                _notifications.sendNotifNow(
                    "Rate My Location",
                    "You gave this location a 5 star rating!",
                    "Payload"
                );
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
