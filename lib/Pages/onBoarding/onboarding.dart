// ignore_for_file: prefer_const_constructors, unused_import, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/contant/onboradingContant.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/widgets/Mybottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/login.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<Screen> {
  int activePage = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        actions: [
          MaterialButton(
            onPressed: ()async {
                SharedPreferences starapp =
                              await SharedPreferences.getInstance();
                          starapp.setBool("starapp", true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Login()));
            },
            // color: const Color(0xff1654A2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text("skip".tr(), style: TextStyle(color: Color(0xff1654A2))),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
                controller: controller,
                onPageChanged: (val) {
                  setState(() {
                    activePage = val;
                  });
                },
                itemCount: content.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Expanded(
                          // flex: 3,
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(content[i].image),
                          ),
                          Text(
                            content[i].title,
                            style: TextStyle(
                                color: Color(0xff1652A4),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 280,
                            child: Text(
                              content[i].desc,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                    ],
                  );
                }),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  MyButtom(
                      // if(){}
    
                      title: activePage == content.length - 1
                          ? "تسجيل الدخول"
                          : "التالي",
                      onPressed: () async {
                        if (activePage == content.length - 1) {
                          SharedPreferences starapp =
                              await SharedPreferences.getInstance();
                          starapp.setBool("starapp", true);
    
    
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()));
                        }
                        controller.nextPage(
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeInOut);
                      },
                      bcColor: Color(0xff1652A4)),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        content.length,
                        (index) => Container(
                          margin: EdgeInsets.all(3),
                          width: activePage == index ? 30 : 10,
                          height: 7,
                          decoration: BoxDecoration(
                              color: activePage == index
                                  ? const Color(0xff1652A4)
                                  : Color.fromARGB(255, 160, 148, 194),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
