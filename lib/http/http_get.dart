import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxdb_loader/main.dart';

void Fetch_Data() async {
  const key = 'E62Fb0TiCLjuAZ7hQ3BK2UtS8lG=/qHizjrPjd55bFE=';
  final url = Uri.parse(
      'http://www.localdata.go.kr/platform/rest/TO0/openDataApi?authKey=E62Fb0TiCLjuAZ7hQ3BK2UtS8lG=/qHizjrPjd55bFE=');
  final response = await http.get(url);
  print(response);
  /*for (var i = 0; i < response.body.length; i++) {
    print(response.body[i]);
  }*/
}
