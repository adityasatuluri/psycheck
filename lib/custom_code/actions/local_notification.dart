// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future localNotification(
  String? title,
  String? content,
) async {
  // Send Local Notification only Android
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the Android initialization settings
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Configure the initialization settings for the FlutterLocalNotificationsPlugin
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: null,
    macOS: null,
  );

  // Initialize the FlutterLocalNotificationsPlugin with the initialization settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configure the notification details
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Configure the notification
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: null,
    macOS: null,
  );

  // Show the notification
  await flutterLocalNotificationsPlugin.show(
    0,
    title ?? '', // Use title parameter here
    content ?? '', // Use content parameter here
    notificationDetails,
    payload: 'item x',
  );
}
