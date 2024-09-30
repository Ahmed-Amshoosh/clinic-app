// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../controller/modeController.dart';

class MyButtom extends StatelessWidget {
  const MyButtom(
      {super.key, required this.title, required this.onPressed, required this.bcColor});
  final String title;
  final void Function()? onPressed;
  final Color bcColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: bcColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: darkmode! ?   const Color.fromARGB(181, 41, 40, 40):  const Color(0xff1652A4))
          ),
      child: Text(
        title.tr(),
        style: const TextStyle(color:Colors.white, fontSize: 16),
      ),
    );
  }
}
