import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_page.dart';
import 'task_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBXFenDY6Knr7xqYNmt2G9fi39bQYV5tcQ",
  authDomain: "taskify-app-24ff5.firebaseapp.com",
  projectId: "taskify-app-24ff5",
  storageBucket: "taskify-app-24ff5.firebasestorage.app",
  messagingSenderId: "598054741165",
  appId: "1:598054741165:web:166b641fde9e864ced1224"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            return const TaskPage(); // Kullanıcı giriş yaptıysa
          } else {
            return const AuthPage(); // Giriş yapılmamışsa
          }
        },
      ),
    );
  }
}
