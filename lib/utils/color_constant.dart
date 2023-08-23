import 'package:flutter/material.dart';

class ColorConstant {
  static Color deepOrange50 = fromHex('#ffdfdc');

  static const Color smokyBlack = Color(0xFF0B0D0F);
  static const Color ghostWhite = Color(0xFFFAFAFD);
  static const Color romanSilver = Color(0xFF88869A);
  static const Color piggyPink = Color(0xFFFFDEE8);
  static const Color mistyRose = Color(0xFFffe2eb);
  static const Color lavenderBlush = Color(0xFFEDFFF9);
  static const Color azure = Color(0xFFFFEDF3);
  static const Color englishLavender = Color(0xFFB4909B);
  static const Color eerieBlack = Color(0xFF1A181C);
  static const Color blushPink = Color(0xFFF8DFE6);
  static const Color grayishBeige = Color(0xFF9E9EB4);
  static const Color mountbattenPink = Color(0xFF7E9E94);
  static const Color roseTaupe = Color(0xFF9E7E88);
  static const Color philippineGray = Color(0xFF7E9E94);
  static const Color lavenderWeb = Color(0xFFE8E4F6);
  static const Color babyBlue = Color(0xFFE6EFFD);
  static const Color blueGrey = Color(0xFF8C8994);
  static const Color figFruitMauve = Color(0xFFAB8691);
  static const Color brilliantWhite = Color(0xFFEAF0FF);
  static const Color powderPuff = Color(0xFFFEEEF3);
  static const Color nostalgiaPerfume = Color(0xFFDEE0F8);
  static const Color plasterCast = Color(0xFFE1EAED);
  static const Color saunaSteam = Color(0xFFEDEBE1);
  static const Color sugarCoated = Color(0xFFFFEDF2);
  static const Color tranquilPond = Color(0xFF788496);
  static const Color imagination = Color(0xFFE1DEEF);
  static const Color hadfieldBlue = Color(0xFF1070FF);
  static const Color appleRose = Color(0xFFB0657C);

  ///  Normal colors
  static Color black = Colors.black;
  static Color black87 = Colors.black87;
  static Color black38 = Colors.black38;
  static Color black26 = Colors.black26;
  static Color black45 = Colors.black45;
  static Color black54 = Colors.black54;
  static Color white = Colors.white;
  static Color white54 = Colors.white54;
  static Color white70 = Colors.white70;
  static Color grey = Colors.grey;
  static Color grey50 = Colors.grey[50]!;
  static Color grey100 = Colors.grey[100]!;
  static Color grey200 = Colors.grey[200]!;
  static Color grey350 = Colors.grey[350]!;
  static Color grey300 = Colors.grey[300]!;
  static Color grey400 = Colors.grey[400]!;
  static Color grey600 = Colors.grey[600]!;
  static Color grey700 = Colors.grey[700]!;
  static Color grey800 = Colors.grey[800]!;
  static Color grey850 = Colors.grey[850]!;
  static Color grey900 = Colors.grey[900]!;
  static Color blueGrey800 = Colors.blueGrey.shade800;
  static Color blue = Colors.blue;
  static Color blueAccent = Colors.blueAccent;
  static Color blue800 = Colors.blue[800]!;
  static Color blue900 = Colors.blue[900]!;
  static Color green = Colors.green;
  static Color red = Colors.red;
  static Color red900 = Colors.red[900]!;
  static Color transparent = Colors.transparent;
  static Color cyan = Colors.cyan;
  static Color pink = Colors.pink;
  static Color orange = Colors.orange;
  static Color purple = Colors.purple;
  static Color yellow = Colors.yellow;
  static Color indigo = Colors.indigo;

  /// const colors
  static const Color greyConst = Colors.grey;
  static const Color black54Const = Colors.black54;
  static const Color white54Const = Colors.white54;
  static const Color whiteConst = Colors.white;
  static const Color blackConst = Colors.black;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


}
