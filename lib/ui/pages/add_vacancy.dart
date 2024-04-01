import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/database/firebaseFirestore/vacancy_collection.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:toast/toast.dart';

class AddVacancyPage extends StatefulWidget {
  const AddVacancyPage({super.key});

  @override
  State<AddVacancyPage> createState() => _AddVacancyPageState();
}

class _AddVacancyPageState extends State<AddVacancyPage> {
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController graphicController = TextEditingController();

  VacancyCollection vacancyCollection = VacancyCollection();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Вакансия",
          style: headerTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: accentColor,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
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
                      Icons.person_pin_circle_rounded,
                      color: accentColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                controller: salaryController,
                style: labelTextStyle2,
                cursorColor: accentColor,
                decoration: InputDecoration(
                    label: const Text(
                      "З/П",
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
                      Icons.monetization_on_rounded,
                      color: accentColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                controller: descController,
                style: labelTextStyle2,
                cursorColor: accentColor,
                decoration: InputDecoration(
                    label: const Text(
                      "Описание",
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
                      Icons.description_rounded,
                      color: accentColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                controller: graphicController,
                style: labelTextStyle2,
                cursorColor: accentColor,
                decoration: InputDecoration(
                    label: const Text(
                      "График",
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
                      Icons.graphic_eq_rounded,
                      color: accentColor,
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (positionController.text.isEmpty ||
                      salaryController.text.isEmpty ||
                      descController.text.isEmpty ||
                      graphicController.text.isEmpty) {
                    Toast.show("Поля пусты, прям как твой кошелек хахаха");
                  } else {
                    vacancyCollection.addVacancy(
                        positionController.text,
                        salaryController.text,
                        descController.text,
                        graphicController.text);
                    Navigator.popAndPushNamed(context, '/home');
                  }
                },
                style: accentedButton,
                child: Text(
                  "OKAY",
                  style: labelTextStyle,
                )),
          ],
        ),
      ),
    );
  }
}
