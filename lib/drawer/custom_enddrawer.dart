// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxdb_loader/drawer/bussiness_category.dart';
import 'package:taxdb_loader/main.dart';

class ThemeSwitchController extends GetxController {
  final RxBool _isDark = isDarkMode.obs;

  Future<void> getChangeTheme(bool value) async {
    _isDark.value = value;
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
    getStoreage.write('isDarkMode', _isDark.value);
  }
}

class CustomEndDrawer extends StatelessWidget {
  CustomEndDrawer({super.key});

  ThemeSwitchController themeSwitchController =
      Get.put(ThemeSwitchController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ListTile(
              title: Center(child: Text('Taxtis 메뉴')),
            ),
            Card(
              child: ListTile(
                title: const Text('설정'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text('관리자 전용'),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: const Text('업종별 DB 조회'),
                                              content: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                child: GridView.builder(
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 1,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10,
                                                      childAspectRatio: 3 / 0.6,
                                                    ),
                                                    itemCount:
                                                        db_category.length,
                                                    itemBuilder:
                                                        ((context, index1) =>
                                                            ElevatedButton(
                                                              onPressed: (() {
                                                                Get.back();
                                                                Get.dialog(
                                                                  AlertDialog(
                                                                    title: const Text(
                                                                        '업종별 DB 조회 2'),
                                                                    content:
                                                                        SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.5,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.5,
                                                                      child: GridView.builder(
                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                3,
                                                                            mainAxisSpacing:
                                                                                10,
                                                                            crossAxisSpacing:
                                                                                10,
                                                                            childAspectRatio:
                                                                                1 / 1,
                                                                          ),
                                                                          itemCount: db_category[index1].length,
                                                                          itemBuilder: ((context, index2) => ElevatedButton(
                                                                                onPressed: (() {
                                                                                  Get.back();
                                                                                  Get.dialog(
                                                                                    AlertDialog(
                                                                                      title: const Text('업종별 DB 조회 3'),
                                                                                      content: SizedBox(
                                                                                        width: MediaQuery.of(context).size.width * 0.5,
                                                                                        height: MediaQuery.of(context).size.height * 0.5,
                                                                                        child: GridView.builder(
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                              crossAxisCount: 3,
                                                                                              mainAxisSpacing: 10,
                                                                                              crossAxisSpacing: 10,
                                                                                              childAspectRatio: 1 / 1,
                                                                                            ),
                                                                                            itemCount: db_category[index1]['lv1_category_list'][index2]['lv2_category_list'].length,
                                                                                            itemBuilder: ((context, index3) => ElevatedButton(
                                                                                                  onPressed: (() {}),
                                                                                                  child: Text(db_category[index1]['lv1_category_list'][index2]['lv2_category_list'][index3]),
                                                                                                ))),
                                                                                      ),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          child: const Text("Close"),
                                                                                          onPressed: () => Get.back(),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                                child: Text(db_category[index1]['lv1_category_list'][index2]['lv2_category']),
                                                                              ))),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        child: const Text(
                                                                            "Close"),
                                                                        onPressed:
                                                                            () =>
                                                                                Get.back(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }),
                                                              child: Text(
                                                                  db_category[
                                                                          index1]
                                                                      [
                                                                      'lv1_category']),
                                                            ))),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Close"),
                                                  onPressed: () => Get.back(),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: const Text('업종별 DB 조회')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("다크모드"),
                                    const SizedBox(width: 10),
                                    Obx(() => Switch(
                                          value: themeSwitchController
                                              ._isDark.value,
                                          onChanged: (value) async {
                                            themeSwitchController
                                                .getChangeTheme(value);
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
