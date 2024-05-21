import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/constanse.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constance.primaryColor,
      appBar: AppBar(
        backgroundColor: Constance.primaryColor,
        centerTitle: true,
        title: const Text(
          'مدیریت کارها',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
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
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.asset(
                        index % 3 == 0
                            ? 'assets/images/undone.png'
                            : 'assets/images/done.png',
                        width: Get.width * 0.08,
                        height: Get.width * 0.08,
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 16, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'عنوان کار',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'توضیحات مربوط به کار توضیحات مربوط به کار توضیحات مربوط به کار توضیحات مربوط به کار',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      const RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          '1403/02/31',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'کل کارها',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  '10 کار',
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {},
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
