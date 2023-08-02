import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class IconInfo extends StatelessWidget {
  final String icon;
  final String text;
  const IconInfo({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/${icon}"),
        SizedBox(
          width: 3,
        ),
        P(
          text: text,
          fontSize: 14,
          color: Color(0xFF232323),
          fontWeight: FontWeight.w500,
        )
      ],
    );
    ;
  }
}