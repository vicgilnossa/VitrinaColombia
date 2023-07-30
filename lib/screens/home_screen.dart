import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vitrina_colombia/controllers/designer_controller.dart';
import 'package:vitrina_colombia/models/designer.dart';
import 'package:vitrina_colombia/models/project.dart';
import 'package:vitrina_colombia/screens/showcase_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ShowCaseScreen(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.white),
          ),
        ),
        width: double.infinity,
        height: 100,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xFF272727),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.search_outline),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.heart_outline),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person_outline),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(DesignerController());
    return Center(
      child: TextButton(
          onPressed: () {
            userController.loadDesigner(Designer(
                name: "Linkcars",
                city: "Cali",
                description: "Diseñador parchado",
                projects: [
                  Project(
                    "Past time",
                    "Mayo 21, 2019",
                    "Diseño",
                    "Eneba",
                    "3D Max",
                    "90",
                    "This form is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.This statue is a relic of the ancient Romans which is currently placed in a museum in Greece.",
                    ["assets/past-time.jpg", "assets/past-time-1.jpg"],
                    345,
                    23,
                  ),
                  Project(
                      "Move house",
                      "Mayo 21, 2019",
                      "Ilustración",
                      "Norma",
                      "Adobe XD",
                      "780",
                      "Como fue",
                      ["assets/move-house.jpg"],
                      21,
                      21)
                ]));
          },
          child: Text("Mandar usuario")),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 4'),
    );
  }
}
