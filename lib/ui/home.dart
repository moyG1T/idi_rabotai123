import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:idi_rabotai123/ui/pages/profile.dart';
import 'package:idi_rabotai123/ui/pages/responses.dart';
import 'package:idi_rabotai123/ui/pages/vacancy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  bool isSearchBar = false;

  List pageList = const [VacancyPage(), ResponsesPage(), ProfilePage()];
  List titleList = const [vacancy, responses, profile];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearchBar ? searchAppbar() : regularAppbar(),
      body: pageList[currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
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
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchBar = !isSearchBar;
                });
              },
              icon: const Icon(
                Icons.search_rounded,
                color: accentColor,
                size: 30,
              ))
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
              ),
              hintText: "Поиск",
              hintStyle: labelTextStyle2,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: accentColor),
              ),
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchBar = !isSearchBar;
                });
                searchController.text = "";
              },
              icon: const Icon(
                Icons.cancel_rounded,
                color: accentColor,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune_rounded,
                color: accentColor,
                size: 30,
              ))
        ],
      );
}
