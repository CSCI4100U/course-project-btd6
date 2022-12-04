import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'MapMarker.dart';
import 'Map.dart';

// TODO:
//  Basis is done, button needs to be implments so when the rating is selected
//  it gives the notification its address and rating.

class Notification {

  final channelID = "TestNotif";
  final channelName = "Test Notification";
  final channelDescription = "Test Notification Description";

  var _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
  NotificationDetails? _platformChannelInfo;
  var _notificationID = 100;

  Future init() async {
    var initializationSettingsAndroid
    = AndroidInitializationSettings('mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
    );

    _flutterLocalNotificationPlugin
        .initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    var androidChannelInfo = AndroidNotificationDetails(channelID,
        channelName, channelDescription: channelDescription);

    _platformChannelInfo = NotificationDetails(
      android: androidChannelInfo,
    );
  }

  void sendNotifNow(String title, String body, String payload) {
    print(_flutterLocalNotificationPlugin.toString());

    _flutterLocalNotificationPlugin.show(
        _notificationID++,
        title,
        body,
        _platformChannelInfo,
        payload: payload
    );
  }

  Future onDidReceiveNotificationResponse
      (NotificationResponse notificationResponse) async{
    if (notificationResponse != null){
      print("NotificationResponse::payload = "
          "${notificationResponse.payload}");
    }
  }
}