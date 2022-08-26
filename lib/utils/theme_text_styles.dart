import 'package:ecommerce_project/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeTextRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "MarkPro";
  static const fontColor = ThemeColors.blue;
  static const size = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

class ThemeTextMedium {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "MarkPro";
  static const fontColor = ThemeColors.blue;

  static const size = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

class ThemeTextBold {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "MarkPro";
  static const fontColor = ThemeColors.blue;

  static const size = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

class ThemeTextSuperBold {
  static const fontWeight = FontWeight.w800;
  static const fontFamily = "MarkPro";
  static const fontColor = ThemeColors.blue;

  static const size = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}
