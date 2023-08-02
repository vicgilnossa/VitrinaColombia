import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class TopNavBar extends StatelessWidget {
  final String? Icon1;
  final String? text;
  final String? customIcon2;
  final void Function()? Icon1CustomFunction;
  final void Function()? Icon2CustomFunction;
  const TopNavBar({
    Key? key,
    this.Icon1,
    this.text,
    this.customIcon2,
    this.Icon1CustomFunction,
    this.Icon2CustomFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon1 != null
            ? GestureDetector(
                onTap: Icon1CustomFunction,
                child: Image.asset("assets/${Icon1!}"))
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
                onTap: Icon2CustomFunction,
                child: Image.asset("assets/${customIcon2!}"))
            : Container(),
      ],
    );
  }
}
