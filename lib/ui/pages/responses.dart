// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/themes.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage({super.key});

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}
final String uid = FirebaseAuth.instance.currentUser!.uid.toString();
class _ResponsesPageState extends State<ResponsesPage> {
  Widget responseCard(context, dynamic docs) => Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightColor2,
            ),
            padding: const EdgeInsetsDirectional.all(10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          docs['title'],
                          style: labelTextStyle2,
                        ),
                        Text(
                          "${docs['salary']} руб.",
                          style: labelTextStyle2,
                        )
                      ],
                    ),
                    const Divider(
                      color: accentColor3,
                    ),
                    SizedBox(
                      child: Text(
                        docs['desc'],
                        style: labelTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        docs['date'],
                        style: labelTextStyle,
                      ),
                      Text(
                        docs['status'],
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: deepColor,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('responses').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var responses = snapshot.data!.docs.where((e) => e['uid'] == uid).toList();
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: responses.length,
                  itemBuilder: (context, index) =>
                      responseCard(context, responses[index]));
            }
          }),
    );
  }
}
