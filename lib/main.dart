import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrina_colombia/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: Routes.routes,
      initialRoute: Routes.welcome,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Back end interno con GetX'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
