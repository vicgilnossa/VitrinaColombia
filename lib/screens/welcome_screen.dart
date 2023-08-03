import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/general-background.png",
              ))),
      child: Column(
        children: const [
          _WelcomeLogo(
            text: 'VitrinaCol.',
          ),
          _WelcomeBody(
            titleText:
                'Descubre lo mejor del diseño y la ilustración colombiana',
            descriptionText:
                'Feel the experience of seeing art from around the world in the palm of your hand without having to come directly to the museum',
          ),
        ],
      ),
    ));
  }
}

class _WelcomeLogo extends StatelessWidget {
  const _WelcomeLogo({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 28, top: 14, bottom: 180),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextLogo(
            text: text,
            size: 32,
          ),
        ),
      ),
    );
  }
}

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody({
    Key? key,
    required this.titleText,
    required this.descriptionText,
  }) : super(key: key);
  final String titleText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      width: double.infinity,
      child: Column(
        children: [
          H1(text: titleText, fontSize: 40),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 48),
            child: P(
                text: descriptionText,
                fontSize: 14,
                color: Colors.white.withOpacity(0.50)),
          ),
          const MainButton(
            text: 'Empezar',
            route: 'home',
          ),
        ],
      ),
    );
  }
}
