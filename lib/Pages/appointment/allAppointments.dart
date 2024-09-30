// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/appointment/Appointment.dart';
import 'package:graduation_project/widgets/Mybottom.dart';

import '../../controller/modeController.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  List data = [];
  bool loading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("appointment")
        .where("state", isNotEqualTo: true)
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {});
    loading = false;
  }

  CollectionReference appointment =
      FirebaseFirestore.instance.collection('appointment');

  // ignore: non_constant_identifier_names
  UpdateUser(String id, bool state) async {
    // Call the user's CollectionReference to add a new user
    try {
      await appointment.doc(id).update({'state': state});
      // ignore: empty_catches
    } catch (e) {}
  }

  List datau = [];
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
  void initState() {
    getData();
    datauser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        // ignore: prefer_is_empty
        : data.length == 0
            ? Center(
                child: Text(
                "there_are_no_appointments".tr(),
                style: const TextStyle(fontSize: 30, color: Color(0xff1654A2)),
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text("About Doctor",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    const SizedBox(
                      height: 15,
                    ),

                    // ignore: sized_box_for_whitespace
                    Container(
                      // width: 200,
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // ignore: avoid_print
                          print(data.length);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: darkmode!
                                        ? const Color.fromARGB(
                                            255, 190, 189, 189)
                                        : Colors.white,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            57, 22, 85, 162)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      // isThreeLine: true,

                                      title: Text(data[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff1652A4))),
                                      leading: Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff1652A4)),
                                      ),
                                      trailing: Text(data[index]['appoint'],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff1652A4))),
                                    ),
                                    loading
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : datau[0]['statUs'] == 1
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  MaterialButton(
                                                    onPressed: () async {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  AlertDialog(
                                                                    title: Icon(
                                                                      Icons
                                                                          .exit_to_app,
                                                                      size: 70,
                                                                      color: darkmode!
                                                                          ? const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              238,
                                                                              238,
                                                                              238)
                                                                          : const Color(
                                                                              0xff1652A4),
                                                                    ),
                                                                    content:
                                                                        Text(
                                                                      "do_you_want_to_cancel_this_appointment"
                                                                          .tr(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: darkmode!
                                                                              ? const Color.fromARGB(255, 238, 238,
                                                                                  238)
                                                                              : const Color(
                                                                                  0xff1652A4),
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    actions: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          MyButtom(
                                                                            title:
                                                                                "yes".tr(),
                                                                            onPressed:
                                                                                () async {
                                                                              await FirebaseFirestore.instance.collection("appointment").doc(data[index].id).delete();
                                                                              setState(() {});

                                                                          
                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyAppointment()));
                                                                            },
                                                                            bcColor:
                                                                                const Color(0xff1652A4),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          MyButtom(
                                                                              title: "no".tr(),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              bcColor: const Color(0xff1652A4)),
                                                                        ],
                                                                      )
                                                                    ],
                                                                    backgroundColor: darkmode!
                                                                        ? const Color
                                                                            .fromARGB(
                                                                            181,
                                                                            41,
                                                                            40,
                                                                            40)
                                                                        : const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            238,
                                                                            238,
                                                                            238),
                                                                  ));

                                                      // UpdateUser(data[index].id, false);
                                                    },
                                                    color: Colors.grey,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Text("cancel".tr(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {
                                                      UpdateUser(
                                                          data[index].id, true);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const MyAppointment()));
                                                    },
                                                    color:
                                                        const Color(0xff1654A2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Text("complete".tr(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              )
                                            : const Center()
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 30,
                    )
                  ],
                ),
              );
  }
}
