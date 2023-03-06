import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogRegChanger extends StatelessWidget {
  const LogRegChanger({
    required this.text,
    required this.onTap,
    super.key,
  });

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
