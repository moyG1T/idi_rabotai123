// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user_service.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:idi_rabotai123/ui/pages/profile.dart';
import 'package:idi_rabotai123/ui/pages/responses.dart';
import 'package:idi_rabotai123/ui/pages/vacancy.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  AuthService authService = AuthService();
  int currentIndex = 0;
  bool isSearchBar = false;

  List pageList = const [VacancyPage(), ResponsesPage(), ProfilePage()];
  List titleList = const [vacancy, responses, profile];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: isSearchBar ? searchAppbar() : regularAppbar(),
      body: pageList[currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: currentIndex == 2
          ? FloatingActionButton(
              backgroundColor: lightColor,
              onPressed: () {
                Navigator.popAndPushNamed(context, '/add_resume');
              },
              child: const Icon(
                Icons.add,
                color: accentColor,
              ),
            )
          : null,
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.work_rounded), label: vacancy),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: responses),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), label: profile),
      ],
      currentIndex: currentIndex,
      onTap: (value) => setState(() {
        currentIndex = value;
      }),
    );
  }

  AppBar regularAppbar() => AppBar(
        centerTitle: true,
        title: Text(titleList[currentIndex]),
        actions: [
          currentIndex != 2
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchBar = !isSearchBar;
                    });
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: accentColor,
                    size: 26,
                  ))
              : IconButton(
                  onPressed: () async {
                    await authService.logOut();
                    Navigator.popAndPushNamed(context, '/');
                    Toast.show("Anti Masturbeck");
                  },
                  icon: const Icon(
                    Icons.exit_to_app_rounded,
                    color: accentColor,
                    size: 26,
                  )),
        ],
      );

  AppBar searchAppbar() => AppBar(
        centerTitle: true,
        title: TextField(
            controller: searchController,
            style: labelTextStyle2,
            cursorColor: accentColor,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: accentColor,
                size: 26,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchBar = !isSearchBar;
                    });
                    searchController.text = "";
                  },
                  icon: const Icon(
                    Icons.cancel_rounded,
                    color: accentColor,
                    size: 26,
                  )),
              hintText: "Поиск",
              hintStyle: labelTextStyle2,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: accentColor),
              ),
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune_rounded,
                color: accentColor,
                size: 26,
              ))
        ],
      );
}
