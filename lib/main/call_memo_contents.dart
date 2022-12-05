// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taxdb_loader/model/model_columnset.dart';

Widget Call_Memo_Contents() {
  return MainPageContainerColumnSet(
    top_bordersideAll: const [false, true, true, true],
    bottom_bordersideAll: const [false, true, false, true],
    width: 0.475,
    height: const [0.04, 0.15],
    contentName: '메모',
  );
}
