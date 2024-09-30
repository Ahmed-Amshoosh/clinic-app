// ignore_for_file: unnecessary_import, unused_import

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/Pages/contant/onboradingContant.dart';
import 'package:graduation_project/Pages/doctors/doctorDetails.dart';
import 'package:graduation_project/generated/l10n.dart';

import '../../controller/modeController.dart';
import '../../widgets/divider.dart';
import '../../widgets/doctorItem.dart';
import '../../widgets/titleCategreyDoctors.dart';
import '../colors/colors.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List doctors = [
    "images/dc5.png",
    "images/dc4.jpg",
    "images/doctor3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: darkmode!
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color(0xff1652A4),
            )),
        title: Text(
        "doctors".tr(),
          style: TextStyle(
              fontSize: 25,
              color: darkmode!
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color(0xff1652A4),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      ),
      backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(61, 158, 158, 158)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(8, 243, 243, 243),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  titleCategreyDoctors(
                    title: "department_of_dental_implants".tr(),
                  ),
                  const MyDivider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[0].name,
                                          location:
                                              info_doctors[0].location,
                                          image: info_doctors[0].image,
                                          cat: info_doctors[0].cat,
                                          eval: info_doctors[0].eval,
                                          exper: info_doctors[0].exper,
                                          sick: info_doctors[0].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[0].image,
                              title: info_doctors[0].name),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[1].name,
                                          location:
                                              info_doctors[1].location,
                                          image: info_doctors[1].image,
                                          cat: info_doctors[1].cat,
                                          eval: info_doctors[1].eval,
                                          exper: info_doctors[1].exper,
                                          sick: info_doctors[1].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[1].image,
                              title: info_doctors[1].name),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[2].name,
                                          image: info_doctors[2].image,
                                          location:
                                              info_doctors[2].location,
                                          cat: info_doctors[2].cat,
                                          eval: info_doctors[2].eval,
                                          exper: info_doctors[2].exper,
                                          sick: info_doctors[2].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[2].image,
                              title: info_doctors[2].name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(61, 158, 158, 158)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(8, 243, 243, 243),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  titleCategreyDoctors(
                    title:"installations_department".tr(),
                  ),
                  const MyDivider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[3].name,
                                          location:
                                              info_doctors[3].location,
                                          image: info_doctors[3].image,
                                          cat: info_doctors[3].cat,
                                          eval: info_doctors[3].eval,
                                          exper: info_doctors[3].exper,
                                          sick: info_doctors[3].sick,
                                        )));
                          },
                          child: DoctorItem(
                            image: info_doctors[3].image,
                            title: info_doctors[3].name,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[4].name,
                                          image: info_doctors[4].image,
                                          cat: info_doctors[4].cat,
                                          location:
                                              info_doctors[4].location,
                                          eval: info_doctors[4].eval,
                                          exper: info_doctors[4].exper,
                                          sick: info_doctors[4].sick,
                                        )));
                          },
                          child: DoctorItem(
                            image: info_doctors[4].image,
                            title: info_doctors[4].name,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[5].name,
                                          image: info_doctors[5].image,
                                          cat: info_doctors[5].cat,
                                          location:
                                              info_doctors[5].location,
                                          eval: info_doctors[5].eval,
                                          exper: info_doctors[5].exper,
                                          sick: info_doctors[5].sick,
                                        )));
                          },
                          child: DoctorItem(
                            image: info_doctors[5].image,
                            title: info_doctors[5].name,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(61, 158, 158, 158)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(8, 243, 243, 243),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  titleCategreyDoctors(
                    title:
                        "Department_of_oral_and_periodontal_surgery".tr(),
                  ),
                  const MyDivider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[6].name,
                                          image: info_doctors[6].image,
                                          cat: info_doctors[6].cat,
                                          location:
                                              info_doctors[6].location,
                                          eval: info_doctors[6].eval,
                                          exper: info_doctors[6].exper,
                                          sick: info_doctors[6].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[6].image,
                              title: info_doctors[6].name),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[7].name,
                                          image: info_doctors[7].image,
                                          location:
                                              info_doctors[7].location,
                                          cat: info_doctors[7].cat,
                                          eval: info_doctors[7].eval,
                                          exper: info_doctors[7].exper,
                                          sick: info_doctors[7].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[7].image,
                              title: info_doctors[7].name),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorsDetails(
                                          name: info_doctors[8].name,
                                          location:
                                              info_doctors[8].location,
                                          image: info_doctors[8].image,
                                          cat: info_doctors[8].cat,
                                          eval: info_doctors[8].eval,
                                          exper: info_doctors[8].exper,
                                          sick: info_doctors[8].sick,
                                        )));
                          },
                          child: DoctorItem(
                              image: info_doctors[8].image,
                              title: info_doctors[8].name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
