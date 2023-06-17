import 'package:flutter/material.dart';
import 'package:erasmus_connect/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineIndigo50 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillLightgreen100 => BoxDecoration(
        color: ColorConstant.lightGreen100,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get fillDeeppurple200aa => BoxDecoration(
        color: ColorConstant.deepPurple200Aa,
      );
  static BoxDecoration get fillGray300 => BoxDecoration(
        color: ColorConstant.gray300,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillDeeppurple100 => BoxDecoration(
        color: ColorConstant.deepPurple100,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
