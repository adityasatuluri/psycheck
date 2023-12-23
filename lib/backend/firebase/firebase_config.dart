import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDnfOjkxWk2BsC_ChwDaJds60shFuM1CD4",
            authDomain: "psycheck-d3b7c.firebaseapp.com",
            projectId: "psycheck-d3b7c",
            storageBucket: "psycheck-d3b7c.appspot.com",
            messagingSenderId: "616629913308",
            appId: "1:616629913308:web:1a9e8a08fc5f36db9cd619",
            measurementId: "G-4745FM7ZMC"));
  } else {
    await Firebase.initializeApp();
  }
}
