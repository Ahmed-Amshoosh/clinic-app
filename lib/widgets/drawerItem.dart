// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {
  const MyDrawerItem(
      {super.key, required this.title, required this.myicons});

  final String title;
  final IconData myicons;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff1652A4),
        ),
      ),
      leading: Icon(
        myicons,
        color: const Color(0xff1652A4),
      ),
    );
  }
}
