import 'package:get/get.dart';
import 'package:vitrina_colombia/models/designer.dart';
import 'package:vitrina_colombia/models/designers.dart';

class DesignerController extends GetxController {
  var designerExists = false.obs;
  var designer = Designer().obs;
  var designers = Designers(designers: []).obs;
  void loadDesigner(Designer newUser) {
    designerExists.value = true;
    designer.value = newUser;
  }

  void loadDesigners(Designers newDesigners) {
    designerExists.value = true;
    designers.value = newDesigners;
  }
}
