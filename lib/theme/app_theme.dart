import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sizes.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme() {
    return ThemeData(
      canvasColor: const Color(0xFFF8EEE2),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: Sizes.h1,
            fontWeight: FontWeight.w600,
            color: Color(0xFF403B36),
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: Sizes.h1,
          fontWeight: FontWeight.w600,
          color: Color(0xFF403B36),
        ),
        headline4: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Sizes.h4,
            height: 1.3,
            color: Colors.black),
        headline5: TextStyle(fontWeight: FontWeight.w500, fontSize: Sizes.h5),
        headline6: TextStyle(fontWeight: FontWeight.w400, fontSize: Sizes.h6),
        bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: Sizes.b1),
      ),
    );
  }
}
