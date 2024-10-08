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

// ipa

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<dynamic> doctors = [];

  // دالة لجلب البيانات من API
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.120.27:8000/api/doctors'));

    if (response.statusCode == 200) {
      // تحويل النص JSON إلى كائن Dart
      setState(() {
        doctors = json.decode(response.body);
      });
    } else {
      // في حال فشل الطلب
      throw Exception('Failed to load data');
    }
  }

  List<dynamic> filterDoctorsByDepartment(String department) {
    return doctors.where((doctor) {
      return doctor['department'] == department;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    // استدعاء الدالة عند بدء التطبيق
    fetchData();
  }

  // List doctors = [
  //   "images/dc5.png",
  //   "images/dc4.jpg",
  //   "images/doctor3.jpg",
  // ];
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
      body: doctors.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                   Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(61, 158, 158, 158),
                      ),
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
                        SizedBox(
                          height: 150, // تحديد الطول المناسب لـ ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // تمرير أفقي
                            itemCount: filterDoctorsByDepartment(
                                    'قسم زراعة الاسنان')
                                .length,
                            itemBuilder: (context, index) {
                              final doctor = filterDoctorsByDepartment(
                                  'قسم زراعة الاسنان')[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorsDetails(
                                        name: doctor['name'],
                                        location: doctor['address'],
                                        image: doctor['image'],
                                        cat: doctor['department'],
                                        eval: doctor['experience'],
                                        exper: doctor['experience'],
                                        sick: '5',
                                        desc: doctor['desc'],
                                        email: doctor['email'],
                                        facebook: doctor['facebook'],
                                        phone: doctor['phone'],
                                        whatsapp: doctor['whatsapp'],
                                      ),
                                    ),
                                  );
                                },
                                child: DoctorItem(
                                  image: doctor['image'],
                                  title: doctor['name'],
                                ),
                              );
                            },
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
                        color: const Color.fromARGB(61, 158, 158, 158),
                      ),
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
                        SizedBox(
                          height: 150, // تحديد الطول المناسب لـ ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // تمرير أفقي
                            itemCount: filterDoctorsByDepartment(
                                    'قسم التراكيب')
                                .length,
                            itemBuilder: (context, index) {
                              final doctor = filterDoctorsByDepartment(
                                  'قسم التراكيب')[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorsDetails(
                                        name: doctor['name'],
                                        location: doctor['address'],
                                        image: doctor['image'],
                                        cat: doctor['department'],
                                        eval: doctor['experience'],
                                        exper: doctor['experience'],
                                        sick: '5',
                                        desc: doctor['desc'],
                                        email: doctor['email'],
                                        facebook: doctor['facebook'],
                                        phone: doctor['phone'],
                                        whatsapp: doctor['whatsapp'],
                                      ),
                                    ),
                                  );
                                },
                                child: DoctorItem(
                                  image: doctor['image'],
                                  title: doctor['name'],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
               
                 
                ,  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(61, 158, 158, 158),
                      ),
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
                        SizedBox(
                          height: 150, // تحديد الطول المناسب لـ ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // تمرير أفقي
                            itemCount: filterDoctorsByDepartment(
                                    'قسم جراحة الفم واللثة')
                                .length,
                            itemBuilder: (context, index) {
                              final doctor = filterDoctorsByDepartment(
                                  'قسم جراحة الفم واللثة')[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorsDetails(
                                        name: doctor['name'],
                                        location: doctor['address'],
                                        image: doctor['image'],
                                        cat: doctor['department'],
                                        eval: doctor['experience'],
                                        exper: doctor['experience'],
                                        sick: '5',
                                        desc: doctor['desc'],
                                        email: doctor['email'],
                                        facebook: doctor['facebook'],
                                        phone: doctor['phone'],
                                        whatsapp: doctor['whatsapp'],
                                      ),
                                    ),
                                  );
                                },
                                child: DoctorItem(
                                  image: doctor['image'],
                                  title: doctor['name'],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
               
                ],
              ),
            ),
    );
  }
}
