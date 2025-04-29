import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBXFenDY6Knr7xqYNmtZ9Gfi39bQYV5tcQ",
      authDomain: "taskify-app-24ff5.firebaseapp.com",
      projectId: "taskify-app-24ff5",
      storageBucket: "taskify-app-24ff5.appspot.com",
      messagingSenderId: "598054741165",
      appId: "1:598054741165:web:166b641fde9e864ced1224",
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirebaseCheckScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirebaseCheckScreen extends StatelessWidget {
  const FirebaseCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Test")),
      body: const Center(
        child: Text(
          "Firebase bağlantısı başarılı!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
