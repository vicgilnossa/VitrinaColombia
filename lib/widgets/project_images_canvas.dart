import 'package:flutter/material.dart';

class ProjectImagesCanvas extends StatelessWidget {
  const ProjectImagesCanvas({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(10, 10),
          child: Container(
            width: double.infinity,
            height: 319,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          child: Image.asset(
            image ?? "assets/past-time.jpg",
            fit: BoxFit.cover,
          ),
          width: double.infinity,
          height: 319,
          color: const Color(0xFFD4D4D4),
        ),
      ],
    );
  }
}
