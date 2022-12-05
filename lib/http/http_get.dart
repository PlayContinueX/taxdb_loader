import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxdb_loader/main.dart';

void Get_Http_Data() async {
  const key = 'E62Fb0TiCLjuAZ7hQ3BK2UtS8lG=/qHizjrPjd55bFE=';
  final url = Uri.parse(
      'http://www.localdata.go.kr/platform/rest/TO0/openDataApi?authKey=E62Fb0TiCLjuAZ7hQ3BK2UtS8lG=/qHizjrPjd55bFE=' +
          '&bgnYmd=20221101' +
          '&endYmd=20221130' +
          '&pageIndex=1' +
          '&pageSize=10' +
          '&resultType=json');
  final response = await http.get(url);
  var jsonResult = jsonDecode(response.body);
  print(jsonResult['result']['body']);
  /*for (var i = 0; i < response.body.length; i++) {
    print(response.body[i]);
  }*/
}
