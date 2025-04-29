import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final taskRef = FirebaseFirestore.instance.collection('users');

  Future<void> addTask(String text) async {
    await taskRef.doc(userId).collection('tasks').add({
      'text': text,
      'createdAt': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getTasks() {
    return taskRef.doc(userId).collection('tasks').orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> deleteTask(String docId) async {
    await taskRef.doc(userId).collection('tasks').doc(docId).delete();
  }
}
