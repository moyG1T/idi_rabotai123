// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/constants/strings.dart';
import 'package:idi_rabotai123/themes.dart';

class VacancyPage extends StatelessWidget {
  const VacancyPage({super.key});

  Widget vacancyCard(context, dynamic docs) => Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightColor2,
            ),
            padding: EdgeInsetsDirectional.all(10),
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
                    Divider(
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
                      ElevatedButton(
                          style: accentedButton,
                          onPressed: () {},
                          child: Text(
                            toResponse,
                            style: labelTextStyle,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
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
              FirebaseFirestore.instance.collection('vacancies').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) =>
                      vacancyCard(context, snapshot.data!.docs[index]));
            }
          }),
    );
  }
}
