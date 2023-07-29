import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              Transform.translate(
                offset: const Offset(10, 10),
                child: Container(
                  margin: const EdgeInsets.only(top: 80, left: 28, right: 28),
                  width: double.infinity,
                  height: 319,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80, left: 28, right: 28),
                width: double.infinity,
                height: 319,
                color: const Color(0xFFD4D4D4),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 26, left: 28, right: 28),
            child: Align(
              alignment: Alignment.centerLeft,
              child: H2(text: "Can you hear me?", color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 28),
            child: Row(
              children: [
                const CircleAvatar(
                  maxRadius: 12,
                ),
                const SizedBox(
                  width: 8,
                ),
                P(text: "Zack Alvarez", color: Colors.white.withOpacity(0.5)),
                const SizedBox(
                  width: 8,
                ),
                P(
                  text: "• Abril 22 2018",
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 21, bottom: 24),
            child: Row(
              children: const [
                LikeButtonCounter(),
                SizedBox(
                  width: 16,
                ),
                CommentsButtonNav(),
                SizedBox(
                  width: 16,
                ),
                ViewsInfo()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Row(
              children: [
                InfoBox(title: "Categoría", info: "Photography"),
                SizedBox(
                  width: 24,
                ),
                InfoBox(title: "Cliente", info: "Colanta"),
                SizedBox(
                  width: 24,
                ),
                InfoBox(title: "Herramienta", info: "Photoshop")
              ],
            ),
          ),
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
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  child: SingleChildScrollView(
                    child: P(
                        text:
                            "This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.",
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                MainButton(text: "Contactar", route: "home")
              ],
            ),
          )
        ]),
      ),
    );
  }
}

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
        SizedBox(
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

class ViewsInfo extends StatelessWidget {
  const ViewsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/white-eye.png"),
        SizedBox(
          width: 3,
        ),
        P(text: "8.9M", color: const Color(0xFF757575))
      ],
    );
  }
}

class CommentsButtonNav extends StatelessWidget {
  const CommentsButtonNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/white-comments.png"),
        SizedBox(
          width: 3,
        ),
        P(text: "45", color: const Color(0xFF757575))
      ],
    );
  }
}

class LikeButtonCounter extends StatefulWidget {
  const LikeButtonCounter({
    Key? key,
  }) : super(key: key);

  @override
  _LikeButtonCounterState createState() => _LikeButtonCounterState();
}

class _LikeButtonCounterState extends State<LikeButtonCounter> {
  int likeCount = 10;
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
