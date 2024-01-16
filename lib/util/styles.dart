import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle textStyleExtraSmall({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
  }

  static TextStyle textStyleSmall({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );
  }

  static TextStyle textStyleMedium({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  static TextStyle textStyleLarge({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
  }

  static TextStyle textStyleExtraLarge({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );
  }

  static TextStyle textStyleExtraLargeBold({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  static TextStyle textStyleHBugeBold({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
  }

  static TextStyle textStyleExtraHugeBold({Color color = Colors.black}) {
    return GoogleFonts.openSans(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );
  }

  static TextStyle textStyleanimation() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.bold,
      fontSize: 50,
    );
  }
}
