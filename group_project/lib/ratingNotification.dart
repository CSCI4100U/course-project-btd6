import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'MapMarker.dart';
import 'Map.dart';

// TODO:
//  Basis is done, button needs to be implments so when the rating is selected
//  it gives the notification its address and rating.

class Notifications {

  final channelID = "Notification";
  final channelName = "Rating Notification";
  final channelDescription = "Notification sent when location is rated";

  var _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  NotificationDetails? _platformChannelInfo;
  var _notificationID = 100;

  init() async {

    if(Platform.isIOS){
      _requestIOSPermission();
    }

    var initializationSettingsAndroid
    = AndroidInitializationSettings('mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (int id,
          String? title, String? body, String? payload){
        return null;
      },
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
    );

    _flutterLocalNotificationsPlugin
        .initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    var androidChannelInfo = AndroidNotificationDetails(channelID,
        channelName, channelDescription: channelDescription);

    var iosChannelInfo = DarwinNotificationDetails();

    _platformChannelInfo = NotificationDetails(
      android: androidChannelInfo,
      iOS: iosChannelInfo,
    );
  }

  void sendNotifNow(String title, String body, String payload) {
    print(_flutterLocalNotificationsPlugin.toString());

    _flutterLocalNotificationsPlugin.show(
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

  _requestIOSPermission(){
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation
    <IOSFlutterLocalNotificationsPlugin>()!.requestPermissions(
      sound: true,
      badge: true,
      alert: false,
    );
  }
}