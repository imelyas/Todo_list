import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var todoList = RxList<Todo>();
  var url =
      Uri.parse('https://664f2b28fafad45dfae2a3cd.mockapi.io/api/todolist');
  Future<RxList<Todo>> getTodoList() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (var item in jsonDecode(response.body)) {
        todoList.add(Todo.fromJson(item));
      }
    }
    return todoList;
  }
}
