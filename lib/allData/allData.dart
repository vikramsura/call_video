import 'package:flutter/material.dart';
import 'package:untitled2/allData/font_sizes.dart';

Widget buildText(text, fontSize, color, fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
  );
}



Widget buildContainer(height, width, color, text, colortext) {
  return Container(
    height: height,
    width: width,
    decoration:
    BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: colortext,
              fontWeight: FontWeight.w700,
              fontSize: AppFontSize.font16),
        )),
  );
}