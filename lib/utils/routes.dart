import 'package:get/get.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/todo_form_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/todo_form', page: () => const TodoFormScreen()),
  ];
}
