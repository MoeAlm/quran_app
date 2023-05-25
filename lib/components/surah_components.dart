import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/color.dart';
import '../models/surah_model.dart';

Widget surahsTitles(double w, double h, int index,
    {required SurahModel model}) {
  return Column(
    children: [
      SizedBox(
        width: w,
        height: h * 0.08,
        child: Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/icons/symbol.png',
                  color: kPrimaryColor,
                ),
                Positioned(
                  top: index < 9 ? w * 0.042 : w * 0.05,
                  left: index < 9 ? w * 0.065 : w * 0.06,
                  child: Text(
                    '${model.number}',
                    style: TextStyle(
                        fontSize: index + 1 < 10 ? w * 0.05 : w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ).px8(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.englishName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: w * 0.05),
                ),
                Text(
                  model.revelationType,
                  style: TextStyle(fontSize: w * 0.032, color: Colors.grey),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              model.name,
              style: TextStyle(fontSize: w * 0.06, color: kPrimaryColor),
            ).pOnly(right: 12)
          ],
        ),
      ),
      const Divider()
    ],
  );
}