// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/database/firebaseFirestore/resume_collection.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:idi_rabotai123/ui/pages/profile.dart';
import 'package:toast/toast.dart';

class AddResumePage extends StatefulWidget {
  const AddResumePage({super.key});

  @override
  State<AddResumePage> createState() => _AddResumePageState();
}

class _AddResumePageState extends State<AddResumePage> {
  dynamic resumeDoc;

  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController descController = TextEditingController();

  ResumeCollection resumeCollection = ResumeCollection();

  final String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;

  getUserById() async {
    final DocumentSnapshot documentSnapshot =
        await collectionReference.doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resumeDoc = ModalRoute.of(context)?.settings.arguments as dynamic;

    if (resumeDoc != null) {
      positionController.text = resumeDoc['position'];
      salaryController.text = resumeDoc['salary'];
      descController.text = resumeDoc['description'];
    }

    ToastContext().init(context);

    Future<void> sendResume() async {
      if (salaryController.text.isEmpty ||
          descController.text.isEmpty ||
          positionController.text.isEmpty) {
        Toast.show('Masturbeck');
      } else {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));

        await resumeCollection.addResume(positionController.text,
            salaryController.text, descController.text, userDoc);

        Navigator.pop(context);
        Navigator.popAndPushNamed(context, '/home');

        Toast.show('Add mast');
      }
    }

    Future<void> editAndSendResume() async {
      if (salaryController.text.isEmpty ||
          descController.text.isEmpty ||
          positionController.text.isEmpty) {
        Toast.show('Masturbeck');
      } else {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));

        await resumeCollection.editResume(positionController.text,
            salaryController.text, descController.text, userDoc);

        Navigator.pop(context);
        Navigator.popAndPushNamed(context, '/home');

        Toast.show('edit & add mast');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: accentColor,
          ),
        ),
        title: Text(
          "Добавление резюме",
          style: headerTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            color: deepColor,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: positionController,
                  style: labelTextStyle2,
                  cursorColor: accentColor,
                  decoration: InputDecoration(
                      label: const Text(
                        "Должность",
                      ),
                      labelStyle: labelTextStyle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor2),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor),
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: const Icon(
                        Icons.person_pin_circle_outlined,
                        color: accentColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: salaryController,
                  style: labelTextStyle2,
                  cursorColor: accentColor,
                  decoration: InputDecoration(
                      label: const Text(
                        "Зарплата",
                      ),
                      labelStyle: labelTextStyle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor2),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor),
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: const Icon(
                        Icons.attach_money_rounded,
                        color: accentColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descController,
                  style: labelTextStyle2,
                  cursorColor: accentColor,
                  decoration: InputDecoration(
                      label: const Text(
                        "О себе",
                      ),
                      labelStyle: labelTextStyle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor2),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: accentColor),
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: const Icon(
                        Icons.accessible_forward_rounded,
                        color: accentColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async =>
                        resumeDoc == null ? sendResume() : editAndSendResume(),
                    style: accentedButton,
                    child: resumeDoc == null
                        ? Text(
                            "Добавить резюме",
                            style: labelTextStyle,
                          )
                        : Text(
                            "Изменить",
                            style: labelTextStyle,
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
