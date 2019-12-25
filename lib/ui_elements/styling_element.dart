import 'package:flutter/material.dart';

import '../colors.dart';

/* --- All the textstyle are present here ---------- */

TextStyle designTextStyle(Color color, String fontFamily, FontWeight fontWeight,
    FontStyle style, double fontSize) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontStyle: style,
    fontSize: fontSize,
  );
}

TextStyle robotoBlackBoldTextStyle() {
  return TextStyle(
    fontFamily: 'roboto',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle monospaceBlackBoldTextStyle() {
  return TextStyle(
      fontFamily: 'monospace',
      fontWeight: FontWeight.bold,
      color: Colors.black87);
}

TextStyle monospaceWhiteTextStyle() {
  return TextStyle(color: Colors.white70, fontFamily: 'monospace');
}

TextStyle monospaceRedBoldItalicTextStyle() {
  return TextStyle(
      fontFamily: 'monospace',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 10.0,
      color: kBlueErrorRed);
}

TextStyle monospaceWhiteItalicTextStyle() {
  return TextStyle(
      fontFamily: 'monospace',
      fontStyle: FontStyle.italic,
      color: Colors.white70);
}

TextStyle monospaceWhiteItalicSmallTextStyle() {
  return TextStyle(
      fontFamily: 'monospace',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
      fontSize: 10.0);
}

TextStyle monospaceBlackBoldItalicTextStyle() {
  return TextStyle(
      fontFamily: 'monospace',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.black87);
}
