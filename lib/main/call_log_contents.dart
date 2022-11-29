// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taxdb_loader/model/model_columnset.dart';

Widget Call_Log_Contents() {
  return MainPageContainerColumnSet(
    l_bordersideAll: const [true, true, false, true],
    r_bordersideAll: const [false, true, false, true],
    width: 0.475,
    height: const [0.04, 0.15],
    contentName: '통화이력',
    contentWidget: Call_Log_Listview(),
  );
}

ListView Call_Log_Listview() {
  return ListView(
      children: List<ListTile>.generate(
          5,
          (index) => ListTile(
                title: Text(
                  '2022-12-01 15:55:55',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {},
                selectedTileColor: Colors.white,
              )));
}
