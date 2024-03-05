import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/database/firebaseFirestore/profile_collection.dart';
import 'package:idi_rabotai123/database/firebaseStorage/image_storage.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

final collectionReference = FirebaseFirestore.instance.collection("profiles");

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectImage;
  XFile? fileName;
  ImageStorage imageStorage = ImageStorage();
  ProfileCollection profileCollection = ProfileCollection();

  selectImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileName = returnImage;
      selectImage = File(returnImage!.path);
    });
  }

  void pushStorage() async {
    await imageStorage.addImageStorage(fileName!);
  }

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

  Widget resumeCard(context, dynamic docs) {
    return Card(
        color: lightColor2,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(docs['position'], style: labelTextStyle),
              Text(docs['salary'], style: labelTextStyle)
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                docs['surname'],
                style: labelTextStyle,
              ),
              Text(docs['name'], style: labelTextStyle),
              Text(docs['patronymic'], style: labelTextStyle),
              Text(docs['email'], style: labelTextStyle),
              Text(docs['phone'], style: labelTextStyle),
              const Expanded(
                child: Divider(
                  color: accentColor3,
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Card(
            color: lightColor2,
            child: Center(
              child: ListTile(
                leading: userDoc['image'] == ''
                    ? IconButton(
                        onPressed: () async {
                          selectImageGallery();
                          if (selectImage != null) {
                            pushStorage();
                            await Future.delayed(const Duration(seconds: 4));
                            await profileCollection.editProfileImage(
                                userDoc, imageStorage.imagePathURL!);
                            initState();
                          } else {
                            Toast.show('NO NO NO MISTER FISH');
                          }
                        },
                        icon: const Icon(
                          Icons.add_photo_alternate_rounded,
                          color: accentColor,
                          size: 30,
                        ))
                    : CircleAvatar(
                        backgroundImage: NetworkImage(userDoc['image']),
                        radius: 30,
                      ),
                title: Text(
                  "${userDoc['surname']} ${userDoc['patronymic'].trim().split(' ').map((l) => l[0]).take(2).join()}. ${userDoc['name'].trim().split(' ').map((l) => l[0]).take(2).join()}.",
                  style: labelTextStyle2,
                ),
                subtitle: Text(
                  "+7 (927) 479-96-25",
                  style: labelTextStyle,
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
        Text(
          "Ваши рюземе",
          style: labelTextStyle2,
        ),
        StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection('profiles')
                .doc(userId)
                .collection('resumes')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  // itemCount: snapshot.data!.docs.length,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      resumeCard(context, snapshot),
                );
              }
            })
      ],
    );
  }
}
