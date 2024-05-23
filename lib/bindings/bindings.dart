import 'package:get/get.dart';
import 'package:todo_list/controller/api/todo_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
