import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/themes.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    style: labelTextStyle2,
                    cursorColor: accentColor,
                    controller: loginController,
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
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.visibility,
                            color: accentColor,
                          ),
                          onPressed: () {},
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: accentedButton,
                          onPressed: () =>
                              Navigator.popAndPushNamed(context, '/home'),
                          child: Text(
                            toLogIn,
                            style: labelTextStyle,
                          )),
                      GestureDetector(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, '/reg'),
                          child: Text(
                            toRegist,
                            style: labelTextStyle,
                          ))
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
