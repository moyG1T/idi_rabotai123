// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user_service.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:toast/toast.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  bool isPasswordRevealed = false;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
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
                    width: MediaQuery.of(context).size.height * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: loginController,
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
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    obscureText: !isPasswordRevealed,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: accentedButton,
                              onPressed: () async {
                                if (loginController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  Toast.show("Mr. Penus");
                                } else {
                                  var user = await authService.signIn(
                                      loginController.text,
                                      passwordController.text);
                                  if (user == null) {
                                    Toast.show("Masturbist");
                                  } else {
                                    Navigator.popAndPushNamed(context, '/');
                                    Toast.show('Masturbeck');
                                  }
                                }
                              },
                              child: Text(
                                toLogIn,
                                style: labelTextStyle,
                              )),
                          GestureDetector(
                              onTap: () =>
                                  Navigator.popAndPushNamed(context, '/'),
                              child: Text(
                                toRegist,
                                style: labelTextStyle,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: accentColor,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.02,
                                  endIndent:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                              ),
                              Text(
                                "или",
                                style: labelTextStyle,
                              ),
                              Expanded(
                                child: Divider(
                                  color: accentColor,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.02,
                                  endIndent:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, '/edit_password'),
                          child: Text(
                            "Забыли пароль?",
                            style: labelTextStyle,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
