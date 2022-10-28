import 'package:flutter/material.dart';
import 'package:trm/config/appColors.dart';


class AppText extends Text {
  final String text;
  final Color? color;
  final double? fontSize;
  final int? maxLine;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final bool? isCenter;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;

  AppText(
      {super.key, required this.text,
        this.isCenter,
        this.maxLine,
        this.textDecoration,
        this.textOverflow,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.fontStyle})
      : super(text,
      overflow: textOverflow,
      textAlign: TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: fontSize != null ? (fontSize - 1.0) : 14 - 1.0,
          decoration: textDecoration,
          color: color ?? AppColors.black,
          fontWeight: fontWeight,
          fontStyle: fontStyle));
}
