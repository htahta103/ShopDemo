import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle DefaultTextStyleApp(FontOption option) {
  return GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: option.fontSize,
      fontStyle: option.fontStyle,
      color: option.color,
      fontWeight: option.fontWeight
    ),
  );
}

class FontOption{
   final double fontSize;
   final FontStyle fontStyle;
   final Color color;
   final FontWeight fontWeight;

  FontOption({this.fontSize = 15, this.fontStyle = FontStyle.normal, this.color = Colors.black, this.fontWeight = FontWeight.normal});
}
