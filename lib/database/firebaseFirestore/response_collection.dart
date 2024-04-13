import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResponsesCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addResponses(dynamic docs) async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid.toString();

      await _firebaseFirestore.collection('responses').add({
        'uid': uid,
        'title': docs["title"],
        'salary': docs["salary"],
        'desc': docs["desc"],
        'date': docs["date"],
        'schedule': docs["schedule"],
        'status': "Открыто"
      });
    } catch (e) {
      return;
    }
  }
  Future<void> removeResponses(dynamic docs) async {
    try {
      await _firebaseFirestore.collection('responses').doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}
