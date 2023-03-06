import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModSnackBar {

  ModSnackBar(
    BuildContext context,
    String text, {
    required Color backgroundColor,
  }) {

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(text, style: GoogleFonts.raleway()),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
