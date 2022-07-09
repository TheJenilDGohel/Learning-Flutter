import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: Vx.white,
        cardColor: ghostWhite,
        buttonColor: bdazzeledBlue,
        accentColor: bdazzeledBlue,
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
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: onyx,
        cardColor: Colors.black,
        buttonColor: darkpinegreen,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );

  //colors
  //-> Light Theme
  static Color roseWhite = Vx.hexToColor("#EBE0E4");
  static Color deepBlue = Vx.hexToColor("#191970");
  static Color bdazzeledBlue = Vx.hexToColor("#235789");
  static Color pinegreen = Vx.hexToColor("#136F63");
  static Color ghostWhite = Vx.hexToColor("#F8F8FF");

  //-> Dark Theme
  static Color darkWhite = Vx.hexToColor("#3d2c31");
  static Color lightBlue = Vx.blue500;
  static Color lightbdazzeledBlue = Vx.hexToColor("#3a6eb9");
  static Color darkpinegreen = Vx.hexToColor("#006666");
  static Color onyx = Vx.hexToColor("#28282B");
}
