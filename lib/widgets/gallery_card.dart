import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class GalleryCard extends StatelessWidget {
  final String title;

  final String viewsQuantity;
  final String commentsQuantity;
  final String likesQuantity;
  final String description;
  final String image;
  final String? owner;
  final String? profilePic;

  const GalleryCard({
    Key? key,
    required this.title,
    required this.viewsQuantity,
    required this.description,
    required this.image,
    required this.owner,
    required this.commentsQuantity,
    required this.likesQuantity,
    required this.profilePic,
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
          viewsQuantity: viewsQuantity,
          description: description,
          image: image,
          owner: owner,
          commentsQuantity: commentsQuantity,
          likesQuantity: likesQuantity,
          profilePic: profilePic,
        ),
      ],
    );
  }
}

class MyButton extends StatefulWidget {
  final String title;

  final String viewsQuantity;
  final String commentsQuantity;
  final String likesQuantity;
  final String description;
  final String image;
  final String? owner;
  final String? profilePic;
  final IconData? icon;

  MyButton({
    Key? key,
    this.icon,
    required this.title,
    required this.viewsQuantity,
    required this.description,
    required this.image,
    required this.owner,
    required this.commentsQuantity,
    required this.likesQuantity,
    required this.profilePic,
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
                  child: CircleAvatar(
                      backgroundImage: AssetImage(widget.profilePic!),
                      backgroundColor: Color(0xFFD4D4D4)),
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
                        text: widget.owner,
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
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 64, top: 8, right: 16, bottom: 8),
                      child: Row(children: [
                        IconInfo(icon: "like.png", text: widget.likesQuantity),
                        const SizedBox(
                          width: 16,
                        ),
                        IconInfo(
                            icon: "comments.png",
                            text: widget.commentsQuantity),
                        const SizedBox(
                          width: 16,
                        ),
                        IconInfo(icon: "eye.png", text: widget.viewsQuantity)
                      ]),
                    ),
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
                            maxLines: 2,
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
