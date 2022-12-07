import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('A'),
            accountEmail: const Text('abcdef@gmail.com'),
            currentAccountPicture: Stack(
              alignment: Alignment.center,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'A',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.amberAccent,
              title: const Text('기간별 DB 조회'),
              onTap: () {
                Get.defaultDialog(
                  title: '기간별 DB 조회',
                  textConfirm: '적용 및 조회',
                  onConfirm: () {},
                  buttonColor: Theme.of(context).primaryColor,
                  confirmTextColor: Colors.white,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.15,
                              child: DateTimePicker(
                                initialValue: '',
                                locale: const Locale('ko'),
                                textAlign: TextAlign.center,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2024),
                                onChanged: (val) => print(val),
                              ),
                            ),
                            const Text('   ~   '),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.15,
                              child: DateTimePicker(
                                initialValue: '',
                                locale: const Locale('ko'),
                                textAlign: TextAlign.center,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2024),
                                onChanged: (val) =>
                                    print(val.replaceAll('-', '')),
                              ),
                            )
                          ],
                        ),
                        DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: [
                            "Brazil",
                            "Italia (Disabled)",
                            "Tunisia",
                            'Canada'
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Menu mode",
                              hintText: "country in menu mode",
                            ),
                          ),
                          onChanged: print,
                          selectedItem: "Brazil",
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
