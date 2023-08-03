import '../controllers/designer_controller.dart';
import '../models/designers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrina_colombia/widgets/gallery_card.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class ShowCaseScreen extends StatelessWidget {
  const ShowCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designerController = Get.put(DesignerController());
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      body: designerController.designerExists.value
          ? ShowcaseBody(designerController: designerController)
          : Container(),
    );
  }
}

class ShowcaseBody extends StatelessWidget {
  const ShowcaseBody({
    Key? key,
    required this.designerController,
  }) : super(key: key);

  final DesignerController designerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Menu(),
        _ShowcaseSwiper(
          designers: designerController.designers.value,
        ),
      ],
    );
  }
}

class _ShowcaseSwiper extends StatelessWidget {
  final Designers designers;

  const _ShowcaseSwiper({super.key, required this.designers});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: designers.designers.length,
        itemBuilder: (context, index) {
          final designer = designers.designers[index];
          return Column(
            children: designer.projects!.map((project) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                child: GalleryCard(
                  title: project.name,
                  viewsQuantity: project.viewsQuantity.toString(),
                  description: project.description,
                  image: project.pictures[0],
                  owner: designer.name,
                  commentsQuantity: project.commentsQuantity.toString(),
                  likesQuantity: project.likesQuantity.toString(),
                  profilePic: designer.profilePicture,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
