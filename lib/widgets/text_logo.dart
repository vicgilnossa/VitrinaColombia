import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLogo extends StatelessWidget {
  final String text;
  const TextLogo({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, top: 24, bottom: 180),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.96,
          ),
        ),
      ),
    );
  }
}
