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
        children: [
          const TextLogo(
            text: 'VitrinaCol.',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            width: double.infinity,
            child: Column(
              children: [
                const H1(
                    text:
                        'Descubre lo mejor del diseño y la ilustración colombiana',
                    fontSize: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 48),
                  child: P(
                      text:
                          'Feel the experience of seeing art from around the world in the palm of your hand without having to come directly to the museum',
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.50)),
                ),
                const MainButton(
                  text: 'Empezar',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
