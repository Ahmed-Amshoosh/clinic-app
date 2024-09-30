// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
   const MyTextFormField({super.key, required this.hinttext,required this.controller, this.validator});
  final String hinttext;
  final TextEditingController? controller;
  
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator:validator ,
      controller: controller,
      validator: validator,
      decoration:  InputDecoration(
          border: const UnderlineInputBorder(),
          focusColor: const Color(0xff1652A4),
          hintText: hinttext,
          ),
    );
  }
}
