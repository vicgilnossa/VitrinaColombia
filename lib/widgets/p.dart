import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class P extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const P({
    Key? key,
    this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "Error text",
      style: GoogleFonts.dmSans(
        color: color,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: -0.42,
      ),
    );
  }
}
