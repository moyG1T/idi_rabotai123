import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class VacancyCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addVacancy(String position, String salary, String description,
      String schedule) async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid.toString();
      final String formattedDate =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      await _firebaseFirestore.collection("vacancies").add({
        'uid': uid,
        'title': position,
        'salary': salary,
        'desc': description,
        'date': formattedDate,
        'schedule': schedule,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editVacancy(
      dynamic docs,
      String position,
      String salary,
      String description,
      String publicationDate,
      String schedule,
      String profileId,
      String groupName) async {
    try {
      await _firebaseFirestore.collection("vacancies").doc(docs.id).set({
        'position': position,
        'salary': salary,
        'description': description,
        'publicationDate': publicationDate,
        'schedule': schedule,
        'profileId': profileId,
        'groupName': groupName
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteVacancy(dynamic docs) async {
    try {
      await _firebaseFirestore.collection("vacancies").doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}
