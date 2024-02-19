import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/themes.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          registration,
          style: headerTextStyle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: accentColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/pics/acc.png',
                    width: MediaQuery.of(context).size.height * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          surname,
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
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          name,
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
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          patronymic,
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
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          telephone,
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
                          Icons.phone_android_rounded,
                          color: accentColor,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          login,
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
                          Icons.email_rounded,
                          color: accentColor,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          password,
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
                          Icons.password_rounded,
                          color: accentColor,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: accentedButton,
                      onPressed: () {},
                      child: Text(
                        toLogIn,
                        style: labelTextStyle,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
