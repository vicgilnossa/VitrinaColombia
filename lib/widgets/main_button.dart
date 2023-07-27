import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  const MainButton({
    Key? key,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(10, 10),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Colors.white),
              ),
            ),
          ),
        ),
        MyButton(
          text: text,
          icon: icon,
        ),
      ],
    );
  }
}

class MyButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  MyButton({required this.text, Key? key, this.icon}) : super(key: key);
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {});

        Timer(const Duration(seconds: 2), () {
          Navigator.pushNamed(context, "home");
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: double.infinity,
        height: 56,
        color: isPressed ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.dmSans(
                color: isPressed ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.48,
              ),
            ),
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(widget.icon),
              ),
          ],
        ),
      ),
    );
  }
}