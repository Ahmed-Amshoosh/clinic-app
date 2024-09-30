// import 'package:app2/scteens/UpcomingSchedle.dart';
// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/appointment/complatedAppintment.dart';

import '../../controller/modeController.dart';
import '../colors/colors.dart';
import 'MyAppointment.dart';
import 'allAppointments.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _ScheduleState();
}

class _ScheduleState extends State<MyAppointment> {
  int _buttonIndex = 0;
  final _scheduleWidgets = [
    const Appointments(),
    const MyAppointments(),
    const complatedAppintmen(),
  ];
  List datau = [];
bool  loading = true;
  datauser() async {
    loading = true;
    QuerySnapshot querySnapshot =
        // await FirebaseFirestore.instance.collection("post").get();
        await FirebaseFirestore.instance
            .collection("infouser")
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
    datau.addAll(querySnapshot.docs);
    setState(() {});
    loading = false;
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:  Icon(
                Icons.arrow_back,
                size: 30,
                color:darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
              )),
          title:  Text(
          "schedule".tr(),
            style: TextStyle(
                fontSize: 25,
                color:darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
        ),
        
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Text(
            //     "جدول المواعيد",
            //     style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF4F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 0;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: _buttonIndex==0? const Color(0xFF1652A4): darkmode! ?  const Color.fromARGB(255, 182, 182, 182):Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "all".tr(),
                          style: TextStyle(
                              color: _buttonIndex==0? Colors.white:Colors.black38,
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 1;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),

                        padding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: _buttonIndex==1? const Color(0xFF1652A4): darkmode! ?  const Color.fromARGB(255, 182, 182, 182):Colors.transparent,
                      
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "my_appointments".tr(),
                          style: TextStyle(
                            color: _buttonIndex==1? Colors.white:Colors.black38,
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    //  datau[0]['statUs'] == 1
                    // ?
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 2;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),

                        padding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: _buttonIndex==2? const Color(0xFF1652A4): darkmode! ?  const Color.fromARGB(255, 182, 182, 182):Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "completed".tr(),
                          style: TextStyle(
                            color: _buttonIndex==2? Colors.white:Colors.black38,
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _scheduleWidgets[_buttonIndex],
          ],
        ),
      ),
    ),
        );
  }
}
