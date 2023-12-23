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

import 'package:http/http.dart' as http; // Import the http package
import 'dart:async'; // Import the async package
import 'dart:convert'; // Import the convert library from the dart:core library

Future<dynamic> invokeChatGPT(
  String apiKey,
  List<dynamic> messages, // This parameter can take any data type
) async {
  // Prepare the data which will be passed over to the ChatGPT Api Call. Note we are adding our
  // inbound chat history messages.
  final data = {
    'messages':
        messages, // An array of messages containing the prompt(s) to generate responses for
    'model': "gpt-3.5-turbo", // The GPT model to use for generating responses
  };

  // We need to setup our API key which is passed in to the function
  final headers = {
    'Authorization':
        'Bearer ' + apiKey, // The OpenAI API key for authentication
    'Content-Type':
        'application/json' // The type of data being sent in the request
  };

  // Prepare our http request and add our prepared data to the body of the message. Also we are
  // adding our headers defined above.
  final request = http.Request(
    'POST', // The type of request to send
    Uri.parse(
        'https://api.openai.com/v1/chat/completions'), // The API endpoint for generating responses
  );
  request.body = json.encode(data); // Encode the data as a JSON string
  request.headers.addAll(headers); // Add the headers to the request

  // Perform the http request to the ChatGPT chat/completions endpoint
  final httpResponse = await request.send();

  // A status 200 is good so we can return the response from the API.
  if (httpResponse.statusCode == 200) {
    // If the response status code is 200
    final jsonResponse = json.decode(await httpResponse.stream
        .bytesToString()); // Decode the response body as a JSON object
    return jsonResponse; // Return the decoded JSON object
  } else {
    // If the response status code is not 200 then typically this is not good. The print will just output
    // the reason to the console. Quite simply an empty response is returned.
    print(
        httpResponse.reasonPhrase); // Print the reason for the response failure
    return {}; // Return an empty map
  }
}
