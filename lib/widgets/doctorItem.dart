// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../controller/modeController.dart';

class DoctorItem extends StatelessWidget {
   const DoctorItem({super.key, required this.title, required this.image});
  final String title;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: CircleAvatar(
              backgroundImage: AssetImage(image, ),
            )
          ),
          Text(
            title,
            style:  TextStyle(
                                  color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
 fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
