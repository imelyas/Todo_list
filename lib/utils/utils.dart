import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

SnackbarController errorSnakbar(http.Response response) {
  return Get.snackbar(
      'خطای ${response.statusCode}', response.reasonPhrase.toString(),
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.dangerous_outlined),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

SnackbarController createSnakbar() {
  return Get.snackbar('عملیات موفق', 'کار مورد نظر با موفقیت ایجاد شد',
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.check),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

SnackbarController updateSnakbar() {
  return Get.snackbar('عملیات موفق', 'کار مورد نظر با موفقیت ویرایش شد',
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.check),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

SnackbarController deleteSnakbar() {
  return Get.snackbar('عملیات موفق', 'کار مورد نظر با موفقیت حذف شد',
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.check),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

SnackbarController doneSnakbar() {
  return Get.snackbar('عملیات موفق', 'کار مورد نظر با موفقیت انجام شد',
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.check),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

SnackbarController emptySnakbar() {
  return Get.snackbar('خطا', 'لطفا فیلدها را پر کنید.',
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.error_outline_outlined),
      margin: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 200));
}

Future deleteConfirmDialog(Function() func) {
  return Get.defaultDialog(
    title: 'توجه',
    textCancel: 'خیر',
    textConfirm: 'بله',
    middleText: 'آیا از حذف این کار مطمئن هستید؟',
    onConfirm: func,
  );
}

Future doneConfirmDialog(Function() func) {
  return Get.defaultDialog(
    title: 'توجه',
    textCancel: 'خیر',
    textConfirm: 'بله',
    middleText: 'آیا از انجام شدن این کار مطمئن هستید؟',
    onConfirm: func,
  );
}
