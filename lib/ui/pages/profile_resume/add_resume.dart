import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/themes.dart';

class AddResumePage extends StatefulWidget {
  const AddResumePage({super.key});

  @override
  State<AddResumePage> createState() => _AddResumePageState();
}

class _AddResumePageState extends State<AddResumePage> {
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      // TODO: сейв резюме
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    style: accentedButton,
                    child: Text(
                      "Добавить резюме",
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
