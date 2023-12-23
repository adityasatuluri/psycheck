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

Future<int> dateDiff() async {
  // return 1 if the difference between last item of appstate list 'date' and todays date is 1
  DateTime now = DateTime.now();
  String dateString = "${now.day}-${now.month}-${now.year}";

  DateTime dateTime1 = DateTime.parse(dateString);
  DateTime dateTime2 =
      DateTime.parse(FFAppState().date[FFAppState().mood.length - 1]);

  int difference = dateTime2.difference(dateTime1).inDays;

  if (difference == 1) {
    return 1;
  } else {
    return -1;
  }
}
