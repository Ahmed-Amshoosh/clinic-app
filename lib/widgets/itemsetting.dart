import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../controller/modeController.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({super.key, required this.myicon, required this.tilte});
  final IconData myicon;
  final String tilte;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          // decoration: BoxDecoration(
          //     color: Colors.blue.shade100, shape: BoxShape.circle),
          child: Icon(
            myicon,
            color: Colors.blue,
            size: 35,
          ),
        ),
        title: Text(
          tilte.tr(),
          style: TextStyle(fontWeight: FontWeight.w500,color:  darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color.fromARGB(255, 17, 17, 17)),
        ),
        trailing:  Icon(Icons.arrow_forward_ios_rounded,color: darkmode! ? const Color.fromARGB(255, 238, 238, 238):Colors.transparent,),
      ),
    );
  }
}
