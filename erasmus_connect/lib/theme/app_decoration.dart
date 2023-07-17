import 'package:flutter/material.dart';
import 'package:erasmus_connect/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get gradientYellow10000Orange700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.yellow10000,
            ColorConstant.orange700,
          ],
        ),
      );
  static BoxDecoration get outlineIndigo50 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;
double get strokeAlignCenter => BorderSide.strokeAlignCenter;
double get strokeAlignOutside => BorderSide.strokeAlignOutside;
