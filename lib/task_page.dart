import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevlerim'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Hoş geldin, ${user?.email ?? "kullanıcı"}!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
