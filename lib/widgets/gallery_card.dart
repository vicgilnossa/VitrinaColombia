import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:vitrina_colombia/widgets/p.dart';

class GalleryCard extends StatelessWidget {
  final String title;
  final String designer;
  final String viewsQuantity;
  final String description;
  final String image;

  const GalleryCard({
    Key? key,
    required this.title,
    required this.designer,
    required this.viewsQuantity,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(10, 10),
          child: Container(
            width: double.infinity,
            height: 339,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Colors.white),
              ),
            ),
          ),
        ),
        MyButton(
            title: title,
            designer: designer,
            viewsQuantity: viewsQuantity,
            description: description,
            image: image),
      ],
    );
  }
}

class MyButton extends StatefulWidget {
  final String title;
  final String designer;
  final String viewsQuantity;
  final String description;
  final String image;
  final IconData? icon;

  MyButton({
    Key? key,
    this.icon,
    required this.title,
    required this.designer,
    required this.viewsQuantity,
    required this.description,
    required this.image,
  }) : super(key: key);
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
          Navigator.pushNamed(context, "detail");
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: double.infinity,
        height: 339,
        color: isPressed ? Colors.black : Colors.white,
        child: Column(
          children: [
            Container(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
                width: double.infinity,
                height: 166,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Color(0xFFD4D4D4)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(backgroundColor: Color(0xFFD4D4D4)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    P(
                        fontWeight: FontWeight.w700,
                        text: widget.title,
                        fontSize: 14,
                        color: Color(0xFF232323)),
                    P(
                        text: "Zack Jarosv",
                        fontSize: 12,
                        color: Color(0xFF757575)),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 64,
                    ),
                    width: double.infinity,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 8),
                        child: Row(
                          children: [
                            Image.asset("assets/eye.png"),
                            SizedBox(
                              width: 3,
                            ),
                            P(
                              text: widget.viewsQuantity,
                              fontSize: 14,
                              color: Color(0xFF232323),
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 64, right: 10),
                    width: double.infinity,
                    height: 63,
                    child: DefaultTextStyle(
                      style: GoogleFonts.dmSans(
                        color: Color(0xFF757575),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.42,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.description,
                            maxLines: 2, // Limita el texto a tres líneas
                            // Mostrar puntos suspensivos (...) al final si el texto se corta
                          ),
                          Text(
                            "Read More...",
                            style: GoogleFonts.dmSans(
                              color: Color(0xFF232323),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.42,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
