import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class TopNavBar extends StatelessWidget {
  final String? customIcon1;
  final String? text;
  final String? customIcon2;
  final void Function()? custom1Functions;
  final void Function()? custom2Functions;
  const TopNavBar({
    Key? key,
    this.customIcon1,
    this.text,
    this.customIcon2,
    this.custom1Functions,
    this.custom2Functions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customIcon1 != null
            ? GestureDetector(
                onTap: custom1Functions,
                child: Image.asset("assets/${customIcon1!}"))
            : Container(),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextLogo(
              text: text ?? "VitrinaCol.",
              size: 18,
            ),
          ),
        ),
        customIcon2 != null
            ? GestureDetector(
                onTap: custom2Functions, child: Image.asset("assets/${customIcon2!}"))
            : Container(),
      ],
    );
  }
}
