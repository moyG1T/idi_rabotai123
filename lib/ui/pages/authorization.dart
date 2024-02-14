import 'package:flutter/material.dart';
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
                    decoration: InputDecoration(
                        label: const Text(
                          "Логин",
                        ),
                        labelStyle: labelTextStyle2,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        label: const Text(
                          "Пароль",
                        ),
                        labelStyle: labelTextStyle2,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: accentedButton,
                          onPressed: () {},
                          child: Text(
                            "Войти",
                            style: labelTextStyle,
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Нет аккаунта?",
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
