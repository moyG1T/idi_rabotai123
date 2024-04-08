import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user_service.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:toast/toast.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    AuthService authService = AuthService();

    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Смена пароля",
          style: headerTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/auth');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: accentColor,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
              TextField(
                controller: emailController,
                style: labelTextStyle2,
                cursorColor: accentColor,
                decoration: InputDecoration(
                    label: const Text(
                      "Почта",
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
              ElevatedButton(
                  style: accentedButton,
                  onPressed: () {
                    authService.editPassword(emailController.text);
                    Toast.show("Запрос отправлен");
                    Navigator.popAndPushNamed(context, '/auth');
                  },
                  child: Text(
                    "Отправить запрос",
                    style: labelTextStyle2,
                  ))
            ]),
          ),
        )),
      ),
    );
  }
}
