import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addVacancy(
      String id,
      String position,
      String salary,
      String description,
      String publicationDate,
      String schedule,
      String profileId,
      String groupName) async {
    try {
      await _firebaseFirestore.collection("vacancies").doc(id).set({
        'uid': id,
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
