import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: GoogleFonts.raleway(),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              prefixIcon: Icon(prefixIcon),
              hintStyle: GoogleFonts.raleway(
              fontWeight: FontWeight.w300,
            ),
              hintText: hintText,
            ),
          ),
        );
      },
    );
  }
}
