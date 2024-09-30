// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../controller/modeController.dart';

class MyTextFormFieldAppoint extends StatelessWidget {
  const MyTextFormFieldAppoint({
    super.key,
    required this.hinttext,
    required this.controller,
    this.myIcon,
    required this.maxline,
    this.readonly,
    this.ontap,
    this.validator,this.isNumber,
  });
  final String hinttext;
  final bool? readonly;
  final int maxline;
  final bool? isNumber;
  final String? Function(String?)? validator;
  final IconData? myIcon;
  final void Function()? ontap;
  final TextEditingController? controller;

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      // borderRadius: BorderRadius.circular(5.5),
      color: const Color.fromARGB(0, 255, 255, 255),
      // elevation: 4,
      // shadowColor: const Color.fromRGBO(158, 158, 158, 0.471),
      child: TextFormField(
        // obscureText: obscureText == null || obscureText ==false? false:true,
        keyboardType: isNumber == false
            ? TextInputType.text
            : const TextInputType.numberWithOptions(decimal: true),
        validator: validator,
        controller: controller,
        style: TextStyle(color:  darkmode!
                ? const Color.fromARGB(255, 238, 238, 238)
                : const Color(0xff1652A4),),
        decoration: InputDecoration(
            hintText: hinttext,
          
            hintStyle:  TextStyle(color: darkmode!
                ? const Color.fromARGB(255, 238, 238, 238)
                : const Color(0xff1652A4),),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor:  darkmode!
                ? const Color.fromARGB(248, 58, 57, 57)
                : const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromARGB(148, 186, 202, 223),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 109, 252),
                )),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            label: Container(
                margin:  const EdgeInsets.only(left: 9), child: Text(hinttext.tr() ,style: TextStyle(color: darkmode!
                ? const Color.fromARGB(255, 238, 238, 238)
                : const Color(0xff1652A4),),)),
            suffixIcon: InkWell(
              onTap: ontap,
              child: Icon(
                myIcon,
                color: const Color(0xff1654A2),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
            onTap: ontap,
      ),
    );
    //   child: TextFormField(
    //     style: TextStyle(
    //       color: darkmode!
    //           ? const Color.fromARGB(255, 238, 238, 238)
    //           : const Color(0xff1652A4),
    //     ),
    //     controller: controller,
    //     validator: validator,
    //     maxLines: maxline,
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor:
    //           darkmode! ? Color.fromARGB(210, 15, 15, 15) : Colors.transparent,

    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(5.5),
    //         borderSide: BorderSide.none,
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(5.5),
    //         borderSide:
    //             const BorderSide(color: Color.fromARGB(255, 1, 77, 184)),
    //       ),

    //       prefixIcon: Icon(
    //         myIcon,
    //         color: darkmode!
    //             ? const Color.fromARGB(255, 238, 238, 238)
    //             : const Color(0xff1652A4),
    //       ),
    //       labelText: hinttext,
    //       labelStyle: TextStyle(
    //         color: darkmode!
    //             ? const Color.fromARGB(255, 238, 238, 238)
    //             : const Color(0xff1652A4),
    //       ),
    //       hintStyle: TextStyle(
    //           color: darkmode!
    //               ? const Color.fromARGB(255, 238, 238, 238)
    //               : const Color(0xff1652A4),
    //           fontWeight: FontWeight.bold),

    //       // filled: true,fillColor: Color.fromARGB(0, 255, 253, 253)
    //     ),
    //     readOnly: readonly!,
    //     onTap: ontap,
    //   ),
    // );
  }
}
