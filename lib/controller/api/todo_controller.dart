import 'dart:convert';
import 'package:get/get.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/utils/utils.dart';

class TodoController extends GetxController {
  var isLoading = false.obs;
  var todoList = <Todo>[].obs;
  getUrl({String id = ''}) =>
      Uri.parse('https://664f2b28fafad45dfae2a3cd.mockapi.io/api/todolist/$id');

  @override
  void onInit() {
    getTodoList();
    super.onInit();
  }

  Future<void> getTodoList() async {
    isLoading.value = true;
    final response = await http.get(getUrl());
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      todoList.value = result.map((e) => Todo.fromJson(e)).toList();
    } else {
      errorSnakbar(response);
    }
    isLoading.value = false;
    update();
  }

  Future<void> addTodo(body) async {
    isLoading.value = true;
    final response = await http.post(getUrl(), body: body);
    if (response.statusCode == 201) {
      await getTodoList();
      createSnakbar();
    } else {
      errorSnakbar(response);
    }
    isLoading.value = false;
  }

  Future<void> editTodo(id, body) async {
    isLoading.value = true;
    final response = await http.put(getUrl(id: id), body: body);
    if (response.statusCode == 200) {
      await getTodoList();
      updateSnakbar();
    } else {
      errorSnakbar(response);
    }
    isLoading.value = false;
  }

  Future<void> deleteTodo(id) async {
    isLoading.value = true;
    final response = await http.delete(getUrl(id: id));
    if (response.statusCode == 200) {
      await getTodoList();
      deleteSnakbar();
    } else {
      errorSnakbar(response);
    }
    isLoading.value = false;
  }

  Future<void> doneTodo(id) async {
    isLoading.value = true;
    var body = jsonEncode({"id": id, "status": true});
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final response = await http.put(getUrl(id: id),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      await getTodoList();
      doneSnakbar();
    } else {
      errorSnakbar(response);
    }
    isLoading.value = false;
  }
}
