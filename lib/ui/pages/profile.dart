import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(
            color: accentColor3,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              color: lightColor2,
              child: Center(
                child: ListTile(
                  leading: const Image(
                    image: AssetImage('lib/pics/acc.png'),
                  ),
                  title: Text(
                    "Тырышкин А. Д.",
                    style: headerTextStyle,
                  ),
                  subtitle: Text(
                    "+7 (927) 479-96-25",
                    style: labelTextStyle2,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.copy_rounded,
                      color: accentColor,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            color: accentColor3,
          )
        ],
      ),
    );
  }
}
