import 'package:flutter/material.dart';
import 'package:taxdb_loader/drawer/listile_item.dart';

Drawer Custom_Drawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.5,
    child: ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listtile_list,
      ),
    ),
  );
}
