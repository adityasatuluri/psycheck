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

Future<double> addList() async {
  // add elements of an appstate list called 'mood'
// Assuming the appstate list called 'mood' contains integers

  int sum = 0;
  int ss = 0;
  for (int i = 0; i < FFAppState().mood.length; i++) {
    sum += FFAppState().mood[i];
    ss += 5;
  }
  return sum / ss;
}

/*
// Generated code for this WebView Widget...
FlutterFlowWebView(
  content: valueOrDefault<String>(
    FFAppState().Address,
    'https://www.google.com/maps/search/mental+health+centres+near+sai+krishna+nagar+1st+lane+,+guntur',
  ),
  bypass: true,
  height: 500,
  verticalScroll: false,
  horizontalScroll: false,
)

*/
