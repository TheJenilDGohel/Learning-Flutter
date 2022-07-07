import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

  //colors

  static Color roseWhite = Vx.hexToColor("#EBE0E4");
  static Color deepBlue = Vx.hexToColor("#191970");
  static Color bdazzeledBlue = Vx.hexToColor("#235789");
  static Color pinegreen = Vx.hexToColor("#136F63");
  static Color ghostWhite = Vx.hexToColor("#F8F8FF");
}
