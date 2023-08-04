import 'package:card_swiper/card_swiper.dart';

import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vitrina_colombia/controllers/designer_controller.dart';
import 'package:vitrina_colombia/models/designer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designerController = Get.put(DesignerController());
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: DetailBody(
        designer: designerController.designer.value,
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  final Designer designer;
  const DetailBody({
    Key? key,
    required this.designer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 12),
          child: SafeArea(
              child: TopNavBar(
            Icon1: "arrow-left.png",
            Icon1CustomFunction: () {
              Navigator.pushNamed(context, "home");
            },
            text: "Details",
          )),
        ),
        _DetailSwiper(designer: designer),
        _Title(designer: designer),
        _OwnerDateBar(designer: designer),
        _WhiteButtonBar(designer: designer),
        _MoreInfoBar(
          designer: designer,
          title1: 'Categoría',
          title2: 'Cliente',
          title3: 'Herramienta',
        ),
        _DescriptionBox(designer: designer)
      ]),
    );
  }
}

class _DetailSwiper extends StatelessWidget {
  const _DetailSwiper({
    Key? key,
    required this.designer,
  }) : super(key: key);

  final Designer designer;

  @override
  Widget build(BuildContext context) {
    final List<String>? firstProjectPictures =
        designer.projects!.isNotEmpty ? designer.projects![0].pictures : null;

    return Container(
      width: double.infinity,
      height: 400,
      child: Swiper(
        pagination: null,
        control: null,
        itemCount: firstProjectPictures?.length ?? 0,
        itemBuilder: (context, index) {
          if (firstProjectPictures != null &&
              index < firstProjectPictures.length) {
            final image = firstProjectPictures[index];
            return Padding(
              padding: EdgeInsets.only(top: 40, left: 28, right: 28),
              child: ProjectImagesCanvas(image: image),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class _DescriptionBox extends StatelessWidget {
  const _DescriptionBox({
    Key? key,
    required this.designer,
  }) : super(key: key);

  final Designer designer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: P(
                    text: "Description",
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.50),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: SingleChildScrollView(
                  child: P(
                      text: designer.projects![0].description,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const MainButton(text: "Contactar", route: "home")
            ],
          ),
        ),
      ],
    );
  }
}

class _MoreInfoBar extends StatelessWidget {
  const _MoreInfoBar({
    Key? key,
    required this.designer,
    required this.title1,
    required this.title2,
    required this.title3,
  }) : super(key: key);
  final Designer designer;
  final String title1;
  final String title2;
  final String title3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Row(
        children: [
          InfoBox(title: title1, info: designer.projects![0].category),
          const SizedBox(
            width: 24,
          ),
          InfoBox(title: title2, info: designer.projects![0].client),
          const SizedBox(
            width: 24,
          ),
          InfoBox(title: title3, info: designer.projects![0].tool)
        ],
      ),
    );
  }
}

class _WhiteButtonBar extends StatelessWidget {
  const _WhiteButtonBar({
    Key? key,
    required this.designer,
  }) : super(key: key);
  final Designer designer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, top: 21, bottom: 24),
      child: Row(
        children: [
          _LikesButtonCounter(
            designer: designer,
          ),
          const SizedBox(
            width: 16,
          ),
          _CommentsButton(designer: designer),
          const SizedBox(
            width: 16,
          ),
          _ViewsButton(designer: designer)
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.designer,
  }) : super(key: key);
  final Designer designer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, left: 28, right: 28),
      child: Align(
        alignment: Alignment.centerLeft,
        child: H2(text: designer.projects![0].name, color: Colors.white),
      ),
    );
  }
}

class _OwnerDateBar extends StatelessWidget {
  const _OwnerDateBar({
    Key? key,
    required this.designer,
  }) : super(key: key);

  final Designer designer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 28),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(designer.profilePicture ?? "assets/profile-pic.jpg"),
            maxRadius: 12,
          ),
          const SizedBox(
            width: 8,
          ),
          P(text: designer.name, color: Colors.white.withOpacity(0.5)),
          const SizedBox(
            width: 8,
          ),
          P(
            text: "• ${designer.projects![0].postDate}",
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}

class _ViewsButton extends StatelessWidget {
  const _ViewsButton({
    Key? key,
    required this.designer,
  }) : super(key: key);
  final Designer designer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/white-eye.png"),
        const SizedBox(
          width: 3,
        ),
        P(
            text: designer.projects![0].viewsQuantity.toString(),
            color: Color(0xFF757575))
      ],
    );
  }
}

class _CommentsButton extends StatelessWidget {
  const _CommentsButton({
    Key? key,
    required this.designer,
  }) : super(key: key);
  final Designer designer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/white-comments.png"),
        const SizedBox(
          width: 3,
        ),
        P(
            text: designer.projects![0].commentsQuantity.toString(),
            color: Color(0xFF757575))
      ],
    );
  }
}

class _LikesButtonCounter extends StatefulWidget {
  const _LikesButtonCounter({
    Key? key,
    required this.designer,
  }) : super(key: key);
  final Designer designer;
  @override
  __LikesButtonCounterState createState() => __LikesButtonCounterState();
}

class __LikesButtonCounterState extends State<_LikesButtonCounter> {
  late int likeCount = widget.designer.projects![0].likesQuantity;
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount -= 1;
      } else {
        likeCount += 1;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: Row(
        children: [
          Icon(
            isLiked ? Ionicons.heart : Ionicons.heart_outline,
            color: isLiked ? Colors.red : Colors.white,
            size: 18,
          ),
          const SizedBox(width: 3),
          P(text: likeCount.toString(), color: const Color(0xFF757575)),
        ],
      ),
    );
  }
}
