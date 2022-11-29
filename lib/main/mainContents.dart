// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:taxdb_loader/model/model_rowset.dart';

Widget MainContents() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          MainPageContainerRowSet(
            width: const [0.15, 0.8],
            height: 0.05,
            l_bordersideAll: const [true, true, true, true],
            r_bordersideAll: const [false, true, true, true],
            contentName: '사업장명',
            contentValue: '플레이컨티뉴엑스12112312321233',
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              MainPageContainerRowSet(
                width: const [0.15, 0.275],
                height: 0.05,
                l_bordersideAll: const [true, true, false, true],
                r_bordersideAll: const [false, true, false, true],
                contentName: '개업장명',
                contentValue: '휴게음식점',
              ),
              MainPageContainerRowSet(
                width: const [0.15, 0.375],
                height: 0.05,
                l_bordersideAll: const [false, true, false, true],
                r_bordersideAll: const [false, true, false, true],
                contentName: '인허가\n일자',
                contentValue: '20221031',
              ),
            ],
          ),
          Row(
            children: const [
              MainPageContainerRowSet(
                width: [0.15, 0.275],
                height: 0.05,
                l_bordersideAll: [true, true, false, true],
                r_bordersideAll: [false, true, false, true],
                contentName: '업태\n구분명',
                contentValue: '커피숍',
              ),
              MainPageContainerRowSet(
                width: [0.15, 0.375],
                height: 0.05,
                l_bordersideAll: [false, true, false, true],
                r_bordersideAll: [false, true, false, true],
                contentName: '소재지\n대표번호',
                contentValue: '010-9858-1615',
                isPhoneNumber: true,
              ),
            ],
          ),
          Row(
            children: const [
              MainPageContainerRowSet(
                width: [0.15, 0.275],
                height: 0.05,
                l_bordersideAll: [true, true, false, true],
                r_bordersideAll: [false, true, false, true],
                contentName: '대표자\n성함',
                contentValue: '',
              ),
              MainPageContainerRowSet(
                width: [0.15, 0.375],
                height: 0.05,
                l_bordersideAll: [false, true, false, true],
                r_bordersideAll: [false, true, false, true],
                contentName: '대표자\n전화번호',
                contentValue: '',
                isPhoneNumber: true,
              ),
            ],
          ),
          MainPageContainerRowSet(
            width: const [0.15, 0.8],
            height: 0.05,
            l_bordersideAll: const [true, true, false, true],
            r_bordersideAll: const [false, true, false, true],
            contentName: '도로명\n전체주소',
            contentValue: '부산광역시 영도구 해양로301번길 55, 아미르공원 (동삼동)',
          ),
        ],
      ),
    ],
  );
}
