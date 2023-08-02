import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String info;
  const InfoBox({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        P(
          text: title,
          color: Colors.white.withOpacity(0.50),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 8,
        ),
        P(
          text: info,
          color: Colors.white,
          fontSize: 12,
        )
      ],
    );
  }
}
