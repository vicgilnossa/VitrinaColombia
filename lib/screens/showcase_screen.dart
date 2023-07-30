import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrina_colombia/models/project.dart';
import 'package:vitrina_colombia/widgets/gallery_card.dart';

import 'package:vitrina_colombia/widgets/widgets.dart';

import '../controllers/designer_controller.dart';
import '../models/designer.dart';

class ShowCaseScreen extends StatelessWidget {
  const ShowCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designerController = Get.put(DesignerController());
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      body: designerController.designerExists.value
          ? GalleryInfo(designerController: designerController)
          : Container(),
    );
  }
}

class GalleryInfo extends StatelessWidget {
  const GalleryInfo({
    Key? key,
    required this.designerController,
  }) : super(key: key);

  final DesignerController designerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: TopNavBar(customIcon1: "menu.png", customIcon2: "search.png"),
        )),
        GallerySwiper(
          designer: designerController.designer.value,
        ),
      ],
    );
  }
}

class GallerySwiper extends StatelessWidget {
  final Designer designer;
  const GallerySwiper({
    Key? key,
    required this.designer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Project>? projects = designer.projects;
    return Expanded(
      child: ListView.builder(
        itemCount: projects!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
            child: GalleryCard(
                title: projects[index].name,
                designer: projects[index].name,
                viewsQuantity: projects[index].viewsQuantity,
                description: projects[index].description,
                image: projects[index].pictures[0]),
          );
        },
      ),
    );
  }
}
