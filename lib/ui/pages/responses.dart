// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';
import 'package:idi_rabotai123/data/response.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:intl/intl.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: responseList.length,
      itemBuilder: (context, index) => Column(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      responseList[index].vacancy!.title!,
                      style: labelTextStyle2,
                    ),
                    Text(
                      responseList[index].vacancy!.salary == null
                          ? "Бесплатно"
                          : "${responseList[index].vacancy!.salary!} руб.",
                      style: labelTextStyle2,
                    )
                  ],
                ),
                const Divider(
                  color: accentColor3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    "wefrkjlbajlbhashbvjdsavjhdsavhjdasvhjadsvhjdsavjhdsavhjdasvjkhasdhjxzc,jkadwshui;acxkmbaswefrkjlbajlbhashbvjdsavjhdsavhjdasvhjadsvhjdsavjhdsavhjdasvjkhasdhjxzc,jkadwshui;acxkmbas",
                    style: labelTextStyle,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        responseList[index].status! ? "Принято" : "Отказано",
                        style: labelTextStyle,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd - kk:mm')
                            .format(responseList[index].date!),
                        style: labelTextStyle,
                      )
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
      ),
    );
  }
}
