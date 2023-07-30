import 'package:get/get.dart';
import 'package:vitrina_colombia/models/designer.dart';

class DesignerController extends GetxController {
  var designerExists = false.obs;
  var designer = Designer().obs;

  void loadDesigner(Designer newUser) {
    this.designerExists.value = true;
    this.designer.value = newUser;
  }
}
