// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/data/vacancy.dart';
import 'package:idi_rabotai123/themes.dart';

class VacancyPage extends StatelessWidget {
  const VacancyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: deepColor,
      child: ListView.builder(
          itemCount: vacancyList.length,
          itemBuilder: (context, index) => Column(
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vacancyList[index].title!,
                              style: labelTextStyle2,
                            ),
                            Text(
                              vacancyList[index].salary.toString(),
                              style: labelTextStyle2,
                            )
                          ],
                        )
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )),
    );
  }
}
