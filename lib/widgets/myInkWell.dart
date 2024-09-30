// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  const MyInkWell(
      {super.key,
      required this.ontap,
      required this.alignment,
      required this.title});
  final void Function()? ontap;
  final AlignmentGeometry alignment;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: alignment,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          )),
    );
  }
}
