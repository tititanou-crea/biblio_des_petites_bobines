import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryTextColor = Color(0xFF12005E);

final ThemeData appTheme = ThemeData(
  useMaterial3: true, // moderne et plus léger
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pink.shade100,
    brightness: Brightness.light,
  ).copyWith(
    primary: Colors.pink.shade200,
    secondary: Colors.pink.shade100,
    background: Colors.white,
    onPrimary: Colors.black,
    onSecondary: Colors.black87,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.sevillana(
      color: kPrimaryTextColor,
      fontSize: 26,
      fontWeight: FontWeight.w400,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kPrimaryTextColor),
    elevation: 0,
  ),
  textTheme: GoogleFonts.sevillanaTextTheme().copyWith(
    bodyLarge: GoogleFonts.sevillana(color: kPrimaryTextColor),
    bodyMedium: GoogleFonts.sevillana(color: kPrimaryTextColor),
    bodySmall: GoogleFonts.sevillana(color: kPrimaryTextColor),
    titleLarge: GoogleFonts.sevillana(
      color: kPrimaryTextColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.pink.shade100,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    shadowColor: Colors.pink.shade50,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.pink.shade50.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.pink.shade200),
  ),
);
