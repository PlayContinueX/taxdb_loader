// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxdb_loader/drawer/bussiness_category.dart';
import 'package:taxdb_loader/main.dart';

class ThemeSwitchController extends GetxController {
  final RxBool _isDark = isDarkMode!.obs;

  Future<void> getChangeTheme(bool value) async {
    _isDark.value = value;
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
    getStoreage.write('isDarkMode', _isDark.value);
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

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
                leading: const Icon(Icons.dataset),
                title: const Text('업종별 DB조회'),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('업종별 DB 조회'),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3 / 0.6,
                            ),
                            itemCount: 7,
                            itemBuilder: ((context, index) => ElevatedButton(
                                onPressed: (() {
                                  Get.back();
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text('업종별 DB 조회'),
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 1 / 1,
                                            ),
                                            itemCount: bussiness_category[index]
                                                .values
                                                .length,
                                            itemBuilder: ((context, index) =>
                                                ElevatedButton(
                                                    onPressed: (() {}),
                                                    child: Text(
                                                        '${bussiness_category[index].keys}'
                                                            .replaceAll('(', '')
                                                            .replaceAll(
                                                                ')', ''))))),
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
                                child: Text('${bussiness_category[index].keys}'
                                    .replaceAll('(', '')
                                    .replaceAll(')', ''))))),
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
              ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("다크모드"),
                                const SizedBox(width: 10),
                                Obx(() => Switch(
                                      value:
                                          themeSwitchController._isDark.value,
                                      onChanged: (value) async {
                                        themeSwitchController
                                            .getChangeTheme(value);
                                      },
                                    )),
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
