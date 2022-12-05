// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taxdb_loader/model/model_columnset.dart';

Widget Call_Log_Contents() {
  return MainPageContainerColumnSet(
    top_bordersideAll: const [true, true, true, true],
    bottom_bordersideAll: const [true, true, false, true],
    width: 0.475,
    height: const [0.04, 0.15],
    contentName: '통화이력',
    contentWidget: Call_Log_Listview(),
  );
}

ListView Call_Log_Listview() {
  return ListView(children: []);
}
