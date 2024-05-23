import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/constanse.dart';

class TodoFormScreen extends StatelessWidget {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  static bool isAdd = true;
  const TodoFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onTap: () {},
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
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green[700],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    'انجام شده',
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
                                      onTap: () {},
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
                                      onTap: () {},
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
