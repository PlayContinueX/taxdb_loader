import 'package:flutter/material.dart';
import 'package:taxdb_loader/main.dart';

List<Widget> listtile_list = [
  const ListTile(
    title: Center(child: Text('Taxtis 메뉴')),
  ),
  Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
    ],
  ),
  Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.home),
        onTap: () {},
      ),
    ],
  ),
  Card(
    child: ListTile(
      title: Text('설정'),
      leading: Icon(Icons.settings),
      onTap: () {},
    ),
  ),
];
