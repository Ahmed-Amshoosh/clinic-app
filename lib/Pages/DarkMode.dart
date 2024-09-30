// ignore_for_file: file_names, unused_import

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/home.dart';
import 'package:graduation_project/controller/modeController.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors/colors.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  // bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: ,
        leading: IconButton(
            onPressed: () {
              setState(() {
                
              });
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Home() ,));
            },
            icon:  Icon(
              Icons.arrow_back,
              size: 30,
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
            )),
        title:  Text(
        "dark_mode".tr(),
          style: TextStyle(
              fontSize: 20,
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
                backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
    
      ),
    backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      body: Column(
        children: [
          Container(
            // color: Colors.white,
            // padding: EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)
            ),
    
            child: SwitchListTile(
              // hoverColor: Colors.red,
              activeColor: Colors.blue,
              // autofocus: true,
              // overlayColor: MaterialStateProperty.all(Colors.amber),
              // activeTrackColor: Colors.pink,
              // thumbColor: MaterialStateProperty.all(Colors.amber),
              // inactiveThumbColor: Colors.blue,
              value: darkmode!,
              onChanged: (val) async {
                
                setState(() {
                  darkmode = val;
                  // ignore: avoid_print
                  print(darkmode);
                });
                SharedPreferences mode =
                    await SharedPreferences.getInstance();
                mode.setBool("mode", darkmode!);
              },
              title: darkmode!
                  ?  Text("dark_mode".tr(), style: const TextStyle(color: Colors.white))
                  :  Text(
                    "light_mode".tr(),
                      style: const TextStyle(color: Colors.black),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
