// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/home.dart';
import 'package:graduation_project/localization_checker.dart';

import '../controller/modeController.dart';
import 'colors/colors.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      appBar: AppBar(
        // elevation: ,
        leading: IconButton(
            onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Home() ,));

            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: darkmode!
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color(0xff1652A4),
            )),
        title: Text(
        "lang".tr(),
          style: TextStyle(
              fontSize: 20,
              color: darkmode!
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color(0xff1652A4),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {
              LocalizationChecker.changeLanguge(context);
              setState(() {
                
              });
              // languge = "ar";
              // setState(() {});
              // SharedPreferences lang =
              //     await SharedPreferences.getInstance();
              // lang.setString("lang", "ar");
              // setState(() {});
    
              // print("object");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const Language())));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: const Color.fromARGB(255, 247, 247, 247)
              ),
              // margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(7),
              child: ListTile(
                title: Text(
                  "عربي",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: darkmode!
                        ? const Color.fromARGB(255, 238, 238, 238)
                        : const Color(0xff1652A4),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              LocalizationChecker.changeLanguge(context);
              //   languge="en";
              setState(() {
    
              });
              // SharedPreferences lang =
              //       await SharedPreferences.getInstance();
              //   lang.setString("lang", "en");
              //   setState(() {
    
              //   });
              // print("object");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: const Color.fromARGB(255, 247, 247, 247)
              ),
              // margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(7),
              child: ListTile(
                title: Text(
                  "English",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: darkmode!
                        ? const Color.fromARGB(255, 238, 238, 238)
                        : const Color(0xff1652A4),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
