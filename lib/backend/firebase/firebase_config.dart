import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDHZAEaX3KZV20lu9Np9fFmV2y6Hdx9Xrw",
            authDomain: "sewera-90b87.firebaseapp.com",
            projectId: "sewera-90b87",
            storageBucket: "sewera-90b87.appspot.com",
            messagingSenderId: "1055728123366",
            appId: "1:1055728123366:web:7529ef40ec42aa03446a27",
            measurementId: "G-4DSDXZE32V"));
  } else {
    await Firebase.initializeApp();
  }
}
