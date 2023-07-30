import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLogo extends StatelessWidget {
  final String text;
  final double size;
  const TextLogo({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.96,
      ),
    );
  }
}
