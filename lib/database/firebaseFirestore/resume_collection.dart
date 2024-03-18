import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ResumeCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String user = FirebaseAuth.instance.currentUser!.uid.toString();

  Future<void> addResume(
      String position, String salary, String description, dynamic docs) async {
    try {
      final String formattedDate =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      await _firebaseFirestore
          .collection('profiles')
          .doc(user)
          .collection('resumes')
          .add({
        'uid': user,
        'position': position,
        'salary': salary,
        'description': description,
        'date': formattedDate,
        'surname': docs['surname'],
        'name': docs['name'],
        'patronymic': docs['patronymic'],
        'phone': docs['phone'],
        'email': docs['email'],
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editResume(
      String position, String salary, String description, dynamic docs) async {
    try {
      final String formattedDate =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      await _firebaseFirestore
          .collection('profiles')
          .doc(user)
          .collection('resumes')
          .doc(docs)
          .update({
        'position': position,
        'salary': salary,
        'description': description,
        'date': formattedDate,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> removeResume(dynamic docs) async {
    try {
      await _firebaseFirestore
          .collection('profiles')
          .doc(user)
          .collection('resumes')
          .doc(docs)
          .delete();
    } catch (e) {
      return;
    }
  }
}
