import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<void> addMaterial(String type) async {
    await FirebaseFirestore.instance.collection('materials').add({
      'type': type,
      'timestamp': DateTime.now(),
    });
  }

  static Stream<QuerySnapshot> getMaterials() {
    return FirebaseFirestore.instance.collection('materials').snapshots();
  }
}
