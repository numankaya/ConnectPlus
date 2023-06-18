import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#6a707c');

  static Color blueGray400 = fromHex('#8390a1');

  static Color indigo50 = fromHex('#e8ecf4');

  static Color gray900 = fromHex('#151515');

  static Color gray90001 = fromHex('#1e232c');

  static Color lightGreen100 = fromHex('#d1edcb');

  static Color gray200 = fromHex('#ebebeb');

  static Color deepPurple100 = fromHex('#cec1ea');

  static Color gray300 = fromHex('#dbdbdb');

  static Color gray50 = fromHex('#f7f8f9');

  static Color gray100 = fromHex('#f5f5f5');

  static Color deepPurple200 = fromHex('#baa7e4');

  static Color black90001 = fromHex('#070707');

  static Color black900 = fromHex('#000000');

  static Color deepPurple200Aa = fromHex('#aabaa7e4');

  static Color gray10001 = fromHex('#f6f7f8');

  static Color blueGray40002 = fromHex('#888888');

  static Color blueGray40001 = fromHex('#838ba1');

  static Color whiteA700 = fromHex('#ffffff');

  static Color cyan400 = fromHex('#34c2c1');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
