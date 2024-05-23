import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/bindings/bindings.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/utils/constanse.dart';
import 'package:todo_list/utils/routes.dart';

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
      getPages: Routes.routes,
      initialRoute: '/home',
      initialBinding: MyBindings(),
      theme: ThemeData(
          fontFamily: 'Vazirmatn',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Constance.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Constance.primaryColor)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
