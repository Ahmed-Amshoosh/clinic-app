// ignore_for_file: unnecessary_this

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/home_category.dart';
import 'package:graduation_project/Pages/setting.dart';
import '../controller/modeController.dart';
import 'colors/colors.dart';
import 'notice.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const Home_Categroy(),
     Setting(),
    // const Doctors(),
        const Notices(),
  ];
  List<Widget> body = [
    // const Home_Categroy(),
    // const Doctors(),
    const Icon(Icons.home_outlined),
    const Icon(Icons.settings_outlined),
    // const Icon(Icons.chat_sharp),
    const Icon(Icons.notifications_none),
    // const Notices(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        top: false,
        child: Scaffold(
          
        backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,

          extendBody: true,
          body: screens[_currentIndex],

        
          bottomNavigationBar: Theme(

            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              
              color:darkmode! ?   const Color.fromARGB(218, 94, 93, 93):  const Color(0xff1652A4),
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              // buttonBackgroundColor: Colors.white,
              index: _currentIndex,
              height: 60,
              items: body,
              onTap: (index) => setState(() => this._currentIndex = index),

              // selectedItemColor: Colors.red,
              // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

              // elevation: 100,
              // currentIndex: _currentIndex,
              // onTap: (int value) {
              //   setState(() {
              //     _currentIndex = value;
              //   });
              // },
              // items: const [
              //   BottomNavigationBarItem(
              //       label: "الرئيسية",

              //       icon: Icon(
              //         Icons.home_outlined,
              //         color: Color(0xff1652A4),
              //       )),
              //   BottomNavigationBarItem(
              //       label: "",
              //       icon: Icon(Icons.widgets_outlined, color: Color(0xff1652A4))),
              //   BottomNavigationBarItem(
              //       label: '',
              //       icon: Icon(Icons.sms_sharp, color: Color(0xff1652A4))),
              //   BottomNavigationBarItem(
              //       label: "",
              //       icon: Icon(Icons.notifications_none_outlined,
              //           color: Color(0xff1652A4))),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
