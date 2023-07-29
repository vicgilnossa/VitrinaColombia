import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/gallery_card.dart';
import 'package:vitrina_colombia/widgets/text_logo.dart';

class ShowCaseScreen extends StatelessWidget {
  const ShowCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      body: Column(
        children: [
          TopNavBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                  child: GalleryCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/menu.png"),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: TextLogo(
                text: "VitrinaCol.",
                size: 18,
              ),
            ),
          ),
          Image.asset("assets/search.png"),
        ],
      ),
    );
  }
}
