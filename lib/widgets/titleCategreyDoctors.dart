// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore

import 'package:flutter/material.dart';

import '../controller/modeController.dart';

class titleCategreyDoctors extends StatelessWidget {
  const titleCategreyDoctors({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.topRight,
        child:  Text(title,
            style:  TextStyle(
                  color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
                fontSize: 15,
                fontWeight: FontWeight.bold)));
  }
}
