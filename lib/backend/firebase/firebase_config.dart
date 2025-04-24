import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB3uk0YFtRxnUPFQVf5jLkZZMYGYtZTRrU",
            authDomain: "dietafacil-bbc40.firebaseapp.com",
            projectId: "dietafacil-bbc40",
            storageBucket: "dietafacil-bbc40.firebasestorage.app",
            messagingSenderId: "1040779624425",
            appId: "1:1040779624425:web:0e5f882f65f0c3cfa89578"));
  } else {
    await Firebase.initializeApp();
  }
}
