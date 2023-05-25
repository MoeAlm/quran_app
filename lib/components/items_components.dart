import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/color.dart';

Widget buildHomeItems(double w, double h,
    {required double height,
    required double width,
    required String image,
    required String title,
    required void Function()? onTap,
    required List<Color> color}) {
  return InkWell(
    onTap: onTap,
    child: DropShadow(
      offset: const Offset(1, 1),
      child: Container(
        width: w * width,
        height: h * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: w * 0.135,
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: w * 0.035,
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        'Read',
                        style: TextStyle(color: kTextColor, fontSize: w * 0.03),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: w * 0.03,
                        color: kTextColor,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ).pOnly(top: 12, left: 12, bottom: 16),
      ),
    ),
  );
}
