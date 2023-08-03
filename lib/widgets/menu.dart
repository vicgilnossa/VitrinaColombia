import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrina_colombia/widgets/widgets.dart';

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _isPopUpOpen = false;

  void _togglePopUp() {
    setState(() {
      _isPopUpOpen = !_isPopUpOpen;
    });

    if (_isPopUpOpen) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF272727),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28, right: 28, top: 40),
                    child: TopNavBar(
                        Icon1: "arrow-left.png",
                        Icon1CustomFunction: () {
                          Navigator.of(context).pop();
                        },
                        text: "Menú"),
                  ),
                  LogOffMenu()
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: TopNavBar(
          Icon1: "menu.png",
          customIcon2: "search.png",
          Icon1CustomFunction: _togglePopUp,
        ),
      ),
    );
  }
}

class LogOffMenu extends StatelessWidget {
  const LogOffMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 40),
        MenuItem(text: "Iniciar sesión", size: 40),
        SizedBox(height: 10),
        MenuItem(
          text: "Registrarse",
          size: 40,
          route: "home",
        ),
        SizedBox(height: 10),
        MenuItem(text: "Condiciones de uso", size: 36),
      ],
    );
  }
}

class MenuItem extends StatefulWidget {
  final String text;
  final double size;
  final String? route;
  const MenuItem({
    Key? key,
    required this.text,
    required this.size,
    this.route,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isPressed = false;

  void _onTap() {
    setState(() {
      _isPressed = !_isPressed;
    });

    if (widget.route != null) {
      Navigator.of(context).pushNamed(widget.route!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Text(
        widget.text,
        style: GoogleFonts.dmSans(
          decoration: TextDecoration.none,
          color: _isPressed ? Colors.amber : Colors.white,
          fontSize: widget.size,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.20,
        ),
      ),
    );
  }
}