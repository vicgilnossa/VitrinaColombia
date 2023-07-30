import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H2 extends StatelessWidget {
  final String text;
  final Color color;
  final double? size;
  const H2({
    Key? key,
    required this.text,
    required this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        color: color,
        fontSize: size ?? 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.72,
      ),
    );
  }
}