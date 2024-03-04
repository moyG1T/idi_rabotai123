import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/themes.dart';

final collectionReference = FirebaseFirestore.instance.collection("profiles");

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;

  getUserById() async {
    final DocumentSnapshot documentSnapshot =
        await collectionReference.doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              color: lightColor2,
              child: Center(
                child: ListTile(
                  leading: userDoc['image'] == ''
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_photo_alternate_rounded,
                            color: accentColor,
                            size: 30,
                          ))
                      : CircleAvatar(
                          backgroundImage: NetworkImage(userDoc['image']),
                        ),
                  title: Text(
                    "${userDoc['surname']} ${userDoc['patronymic'].trim().split(' ').map((l) => l[0]).take(2).join()}. ${userDoc['name'].trim().split(' ').map((l) => l[0]).take(2).join()}.",
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
          ListView(
            children: const [
              ListTile(
                title: Text("asd"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
