import 'package:flutter/material.dart';
import 'package:vitrina_colombia/widgets/gallery_card.dart';

import 'package:vitrina_colombia/widgets/widgets.dart';

class ShowCaseScreen extends StatelessWidget {
  const ShowCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      body: Column(
        children: [
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: TopNavBar(
                customIcon1: "menu.png",
                customIcon2: "search.png"),
          )),
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
