import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        )     
      );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        );
      
      //colors
      static Color creamColor = Color(0XFFFF5F5);
      static Color darkBluishColor = Color(0xff403b58);
}