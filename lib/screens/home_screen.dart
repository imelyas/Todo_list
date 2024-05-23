import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/api/todo_controller.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/screens/todo_form_screen.dart';
import 'package:todo_list/utils/constanse.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Constance.primaryColor,
        appBar: AppBar(
          backgroundColor: Constance.primaryColor,
          centerTitle: true,
          title: const Text(
            'مدیریت کارها',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_rounded,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                )),
          ],
        ),
        body: const Column(
          children: [TopPanel(), MainContent()],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(Get.width * 0.15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Obx(() {
          var todoController = Get.find<TodoController>();
          if (todoController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (todoController.todoList.isEmpty) {
              return const Center(
                child: Icon(Icons.error_outline_rounded),
              );
            } else {
              return ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    var todo = todoController.todoList.reversed.toList()[index];
                    return TodoCard(
                      todo: todo,
                    );
                  });
            }
          }
        }),
      ),
    ));
  }
}

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TodoFormScreen.isAdd = false;
        TodoFormScreen.titleController.text =
            utf8.decode(todo.title.runes.toList());
        TodoFormScreen.descController.text =
            utf8.decode(todo.desc.runes.toList());
        TodoFormScreen.id = todo.id;
        TodoFormScreen.status = todo.status;
        Get.toNamed('/todo_form');
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                todo.status
                    ? 'assets/images/done.png'
                    : 'assets/images/undone.png',
                width: Get.width * 0.08,
                height: Get.width * 0.08,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        utf8.decode(todo.title.runes.toList()),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        utf8.decode(todo.desc.runes.toList()),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w200, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  todo.createdAt,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopPanel extends StatelessWidget {
  const TopPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.12,
      decoration: const BoxDecoration(
        color: Constance.primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'کل کارها',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Obx(() {
                  if (Get.find<TodoController>().isLoading.value) {
                    return const SizedBox(
                      width: 8,
                      height: 8,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      ),
                    );
                  }
                  return Text(
                    '${Get.find<TodoController>().todoList.length} کار',
                    style: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  );
                }),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  TodoFormScreen.isAdd = true;
                  TodoFormScreen.titleController.clear();
                  TodoFormScreen.descController.clear();
                  Get.toNamed('/todo_form');
                },
                child: Container(
                  width: Get.width * 0.35,
                  height: Get.width * 0.13,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Constance.primaryColor,
                      ),
                      Text(
                        'کار جدید',
                        style: TextStyle(
                            color: Constance.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
