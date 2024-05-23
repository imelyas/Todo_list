import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/api/todo_controller.dart';
import 'package:todo_list/utils/constanse.dart';
import 'package:todo_list/utils/utils.dart';

class TodoFormScreen extends StatelessWidget {
  static String id = '';
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  static bool isAdd = true;
  static bool status = false;
  const TodoFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoController = Get.find<TodoController>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Constance.primaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )),
          title: Text(
            isAdd ? 'افزودن کار جدید' : 'ویرایش کار',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextField(
                    label: 'عنوان کار',
                    controller: titleController,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  MyTextField(
                    label: 'توضیحات کار',
                    controller: descController,
                    lines: 5,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  isAdd
                      ? GestureDetector(
                          onTap: () {
                            if (titleController.text.isEmpty ||
                                descController.text.isEmpty) {
                              emptySnakbar();
                            } else {
                              todoController.addTodo({
                                'title': titleController.text,
                                'desc': descController.text,
                                'created_at': '1403/03/03',
                              });
                              Get.back();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Constance.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'افزودن',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          ))
                      : status
                          ? Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          'بازگشت',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                      )),
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        deleteConfirmDialog(() {
                                          todoController.deleteTodo(id);
                                          Get.back();
                                          Get.back();
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          'حذف',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                      )),
                                )
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      doneConfirmDialog(() {
                                        todoController.doneTodo(id);
                                        Get.back();
                                        Get.back();
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.green[700],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                          child: Text(
                                        'تغییر به انجام شده',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )),
                                    )),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            if (titleController.text.isEmpty ||
                                                descController.text.isEmpty) {
                                              emptySnakbar();
                                            } else {
                                              todoController.editTodo(id, {
                                                'title': titleController.text,
                                                'desc': descController.text,
                                              });
                                              Get.back();
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Constance.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                                child: Text(
                                              'ویرایش',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )),
                                          )),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.05,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            deleteConfirmDialog(() {
                                              todoController.deleteTodo(id);
                                              Get.back();
                                              Get.back();
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                                child: Text(
                                              'حذف',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )),
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String label;
  final int lines;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.label,
      this.lines = 1,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black54,
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        labelStyle: const TextStyle(color: Colors.black45),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black38,
            )),
      ),
    );
  }
}
