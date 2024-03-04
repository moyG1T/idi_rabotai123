// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user_service.dart';
import 'package:idi_rabotai123/database/firebaseFirestore/profile_collection.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:toast/toast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();
  ProfileCollection profileCollection = ProfileCollection();

  bool isPasswordRevealed = false;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                    controller: surnameController,
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
                    controller: nameController,
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
                    controller: patronymicController,
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
                    controller: phoneController,
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
                    controller: emailController,
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
                    controller: passwordController,
                    obscureText: !isPasswordRevealed,
                    obscuringCharacter: '*',
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        label: const Text(
                          password,
                        ),
                        suffixIcon: IconButton(
                          icon: !isPasswordRevealed
                              ? const Icon(
                                  Icons.visibility,
                                  color: accentColor,
                                )
                              : const Icon(
                                  Icons.visibility_off_rounded,
                                  color: accentColor,
                                ),
                          onPressed: () {
                            setState(() {
                              isPasswordRevealed = !isPasswordRevealed;
                            });
                          },
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
                      onPressed: () async {
                        if (surnameController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            patronymicController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          Toast.show('Mr. Penus');
                        } else {
                          var user = await authService.signUp(
                              emailController.text, passwordController.text);
                          if (user == null) {
                            Toast.show('Takoi masturbeck ne pravilen');
                          } else {
                            await profileCollection.addProfile(
                                user.id!,
                                surnameController.text,
                                nameController.text,
                                patronymicController.text,
                                phoneController.text,
                                emailController.text,
                                passwordController.text,
                                '');
                            Toast.show('New masturbeck, now u suck some cock');
                            Navigator.popAndPushNamed(context, '/');
                          }
                        }
                      },
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
