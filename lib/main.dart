import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/utils/constanse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Vazirmatn',
          useMaterial3: true,
          primaryColor: Constance.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Constance.primaryColor)),
      debugShowCheckedModeBanner: false,
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
