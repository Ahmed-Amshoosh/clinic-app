// ignore_for_file: avoid_print, use_build_context_synchronously, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/appointment/Appointment.dart';
import 'package:graduation_project/widgets/Mybottom.dart';
import 'package:graduation_project/widgets/textformfeildAppoint.dart';

import '../../controller/modeController.dart';
import '../colors/colors.dart';

// ignore: camel_case_types
class Make_Appointment extends StatefulWidget {
  const Make_Appointment({super.key});

  @override
  State<Make_Appointment> createState() => _Make_AppointmentState();
}

// ignore: camel_case_types
class _Make_AppointmentState extends State<Make_Appointment> {
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController userGender = TextEditingController();
  TextEditingController userProblem = TextEditingController();
  TextEditingController userNote = TextEditingController();
  String? gender;
  DateTime? dateTime;

  @override
  void initState() {
    dateTimeController.text = "";
    super.initState();
  }

  Future<void> _selectDate() async {
    DateTime? d = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    );
    if (d != null) {
      setState(() {
        dateTimeController.text = d.toString().split(" ")[0];
      });
    }
  }

  CollectionReference appointment =
      FirebaseFirestore.instance.collection('appointment');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return appointment
        .add({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': userName.text, // John Doe
          'age': userAge.text, // John Doe
          'gender': userGender.text, // John Doe
          'perblem': userProblem.text, // John Doe
          'appoint': dateTimeController.text, // John Doe
          'notes': userNote.text, // Stokes and Sons
          'state': false, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  GlobalKey<FormState> formstate = GlobalKey();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    List genders = ["male".tr(), "female".tr()];

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
          "make_appoint".tr(),
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
            // //  ===========================  //Start MyTextFormFieldAppoint ===================================
            Form(
              key: formstate,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    MyTextFormFieldAppoint(
                      isNumber: false,
                      // validator: (val) {
                      //   return validInput(val!, 5, 20, "username");
                      // },
                      validator: (name) => name!.length < 5
                          ? "لايمكن ان يكون هذا الحقل فارغ او اقل 5 احرف "
                          : null,
                      hinttext: "patient_name".tr(),
                      controller: userName,
                      myIcon: Icons.person,
                      readonly: false,
                      maxline: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormFieldAppoint(
                        hinttext: "patient_age".tr(),
                        controller: userAge,
                        readonly: false,
                        // validator: (val) {
                        //   return validInput(val!, 1, 3, "age");
                        // },
                        validator: (val) => val!.isNotEmpty
                            ? val.length > 3
                                ? " لا ايمكن ان يكون هذا الحقل اكبر من 3  "
                                : null
                            : "لا ايمكن ان يكون هذا الحقل فارغ  ",
                        myIcon: Icons.groups_outlined,
                        maxline: 1),
                    const SizedBox(
                      height: 20,
                    ),

                    // const SizedBox(
                    //   height: 10,
                    // ),
                    MyTextFormFieldAppoint(
                        isNumber: false,
                        hinttext: "patient_problem".tr(),
                        controller: userProblem,
                        readonly: false,
                        validator: (name) => name!.length < 3
                            ? "لايمكن ان يكون هذا الحقل فارغ او اقل 3 احرف "
                            : null,
                        // validator: (val) {
                        //   return validInput(val!, 4, 20, "problem");
                        // },
                        myIcon: Icons.sync_problem,
                        maxline: 1),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormFieldAppoint(
                      isNumber: false,
                      // validator: (val) {
                      //   return validInput(val!, 1, 1, "date");
                      // },
                      validator: (name) => name!.isEmpty
                          ? "لايمكن ان يكون هذا الحقل فارغ  "
                          : null,
                      hinttext: "booking_date".tr(),
                      controller: dateTimeController,
                      readonly: true,
                      ontap: () {
                        _selectDate();
                      },
                      myIcon: Icons.schedule,
                      maxline: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormFieldAppoint(
                        isNumber: false,
                        hinttext: "notice".tr(),
                        controller: userNote,
                        readonly: false,
                        myIcon: Icons.note_alt_outlined,
                        maxline: 2),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {},
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 22),
                        decoration: BoxDecoration(
                          color: darkmode!
                              ? const Color.fromARGB(206, 59, 59, 59)
                              : Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(6, 80, 79, 79),
                              blurRadius: 0.2,
                              spreadRadius: 0.2,
                              offset: Offset(
                                -0.8,
                                2,
                              ),
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(148, 186, 202, 223)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton(
                          dropdownColor: darkmode!
                              ? const Color.fromARGB(181, 41, 40, 40)
                              : Colors.white,
                          // focusColor: Color.fromARGB(181, 41, 40, 40),
                          // dropdownColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          underline: const Text(""),
                          elevation: 4,
                          hint: Row(
                            children: [
                              Icon(
                                Icons.wc,
                                color: darkmode!
                                    ? const Color.fromARGB(255, 238, 238, 238)
                                    : const Color(0xff1652A4),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("patient_gender".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: darkmode!
                                        ? const Color.fromARGB(
                                            255, 238, 238, 238)
                                        : const Color(0xff1652A4),
                                  )),
                            ],
                          ),
                          isExpanded: true,
                          value: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val as String?;
                            });
                          },
                          items: genders.map((valItem) {
                            return DropdownMenuItem(
                                value: valItem,
                                child: Text(valItem,
                                    style: TextStyle(
                                      color: darkmode!
                                          ? const Color.fromARGB(
                                              255, 238, 238, 238)
                                          : const Color(0xff1652A4),
                                    )));
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            //  ===========================  //End MyTextFormFieldAppoint ===================================
            MyButtom(
                bcColor: const Color(0xff1652A4),
                title: "make_appoint".tr(),
                onPressed: () async {
                  if (formstate.currentState!.validate()) {
                    loading = true;
                    setState(() {});
                    await addUser();
                    loading = false;
                    setState(() {});
                    // Navigator.replace(
                    //     oldRoute: MaterialPageRoute(
                    //         builder: (context) => Home()),
                    //     newRoute: MaterialPageRoute(
                    //         builder: (context) => const Make_Appointment()),

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const MyAppointment() ,));
                      
                        
                    showDialog(
                      // ignore: use_build_context_synchronously
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                              color: Color(0xff1652A4),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        title: Image.asset(
                          "images/logo.png",
                          height: 150,
                        ),
                        content: Text(
                          
                              "Thank_you_your_reservation_has_been_completed_successfully".tr(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xff1652A4),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );

                    
                  }
                })
          ],
        ),
      ),
    );
  }
}
