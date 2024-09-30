// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, unnecessary_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/Pages/appointment/Appointment.dart';

import '../../controller/modeController.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  List data = [];
  bool loading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("appointment")
        // .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("state", isNotEqualTo: true)
        .get();
    // .get();
    // // await FirebaseFirestore.instance.collection("infouser").get();
    // for (var i = 0; i < querySnapshot.docs.length; i++) {
    //   if (querySnapshot.docs[i]['state'] == false) {
        data.addAll(querySnapshot.docs);
        setState(() {});
      // }
    // }
    // print(querySnapshot.docs[0]['state']);
    loading = false;
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : data.isEmpty
            ?  Center(
                child: Text(
                "there_are_no_appointments".tr(),
                style: const TextStyle(fontSize: 30, color: Color(0xff1654A2)),
              ))
            : Column(
                children: [
                  SingleChildScrollView(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 800,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(5),
                              // height: 125,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(15, 0, 31, 68),
                                  ),
                                color:darkmode!? const Color.fromARGB(255, 180, 180, 180):Colors.white,

                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                // height: 80,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text("${1 + index}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 22, 82, 164))),
                                      title: Text(data[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1652A4))),
                                      // ignore: avoid_unnecessary_containers
                                      trailing: Container(
                                        child: Text(data[index]['appoint'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff1652A4))),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.red,
                                        padding: const EdgeInsets.only(
                                            right: 30, bottom: 10),
                                        width: double.infinity,
                                        child: Text(data[index]['perblem'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff1652A4)))),
                                    InkWell(
                                      onTap: () async {
                                        // print(data[index].id);
                                        await FirebaseFirestore.instance
                                            .collection("appointment")
                                            .doc(data[index].id)
                                            .delete();
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAppointments()));
                                        Navigator.pushReplacement(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyAppointment()));
                                        // Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: 30,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff1654A2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child:  Text(
                                        "delete".tr(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              );

    // Container(
    //   padding: const EdgeInsets.symmetric(vertical: 5),
    //   decoration: BoxDecoration(
    //       color: darkmode! ? Color.fromARGB(181, 70, 69, 69) : Colors.white,
    //       borderRadius: BorderRadius.circular(10),
    //       border: Border.all(
    //           width: 1, color: const Color.fromARGB(40, 255, 255, 255)),
    //       boxShadow: [
    //         BoxShadow(
    //             color: darkmode!
    //                 ? const Color.fromARGB(20, 255, 255, 255)
    //                 : Colors.black12,
    //             blurRadius: 4,
    //             spreadRadius: 2),
    //       ]),
    //   child: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Row(
    //               children: [
    //                 Icon(
    //                   Icons.person_2_outlined,
    //                   color: darkmode! ? Colors.white : Color(0xff1652A4),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   data[0]['name'],
    //                   style: TextStyle(
    //                       color: darkmode!
    //                           ? const Color.fromARGB(255, 238, 238, 238)
    //                           : const Color(0xff1652A4),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15),
    //                 ),
    //               ],
    //             ),

    //             Row(
    //               children: [
    //                   Icon(Icons.calendar_month,
    //                     color: darkmode! ? Colors.white : Color(0xff1652A4)),
    //                 Text(
    //                     data[0]['appoint'],
    //                   style: TextStyle(
    //                       color: darkmode!
    //                           ? const Color.fromARGB(255, 238, 238, 238)
    //                           : const Color(0xff1652A4),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15),
    //           child: Divider(
    //             thickness: 1,
    //             height: 20,
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Row(
    //               children: [

    //                 const SizedBox(
    //                   width: 5,
    //                 ),

    //                 Text(
    //                   data[0]['perblem'],
    //                   textAlign: TextAlign.right,
    //                   style: TextStyle(
    //                     color: darkmode!
    //                         ? const Color.fromARGB(255, 238, 238, 238)
    //                         : Colors.black,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 15,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             MyButtom(
    //               onPressed: () {

    //                   showDialog(
    //                     context: context,
    //                     builder: (context) => AlertDialog(

    //                           title: Icon(
    //                             Icons.delete_outlined,
    //                             size: 70,
    //               color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
    //                           ),
    //                           content:  Text(
    //                             "هل تريد حذف الموعد  ",
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //               color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                           actions: [
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 MyButtom(
    //                                   title: "نعم",
    //                                   onPressed: () {
    //                                       FirebaseFirestore.instance
    //                                       .collection("appointment")
    //                                       .doc(data[0].id)
    //                                       .delete();
    //                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAppointments()));
    //                                   },
    //                                   bcColor: const Color(0xff1652A4),
    //                                 ),
    //                                 const SizedBox(
    //                                   width: 20,
    //                                 ),
    //                                 MyButtom(
    //                                     title: "لا",
    //                                     onPressed: () {
    //                                       Navigator.pop(context);
    //                                     },
    //                                     bcColor: const Color(0xff1652A4)),
    //                               ],
    //                             )
    //                           ],
    //                           backgroundColor:darkmode! ? const Color.fromARGB(181, 41, 40, 40): const Color.fromARGB(255, 238, 238, 238),

    //                         ));

    //                 // FirebaseFirestore.instance
    //                 //             .collection("appointment")
    //                 //             .doc(data[0].id)
    //                 //             .delete();
    //                         // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));

    //               },
    //               title: "حذف",
    //               bcColor: const Color(0xff1652A4),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // Container(
    //   padding: const EdgeInsets.symmetric(vertical: 5),
    //   decoration: BoxDecoration(
    //       color: darkmode! ? Color.fromARGB(181, 70, 69, 69) : Colors.white,
    //       borderRadius: BorderRadius.circular(10),
    //       border: Border.all(
    //           width: 1, color: const Color.fromARGB(40, 255, 255, 255)),
    //       boxShadow: [
    //         BoxShadow(
    //             color: darkmode!
    //                 ? const Color.fromARGB(20, 255, 255, 255)
    //                 : Colors.black12,
    //             blurRadius: 4,
    //             spreadRadius: 2),
    //       ]),
    //   child: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     child:
    //      Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Row(
    //               children: [
    //                 Icon(
    //                   Icons.person_2_outlined,
    //                   color: darkmode! ? Colors.white : Color(0xff1652A4),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   " أحمد عبدالله عبدالله",
    //                   style: TextStyle(
    //                       color: darkmode!
    //                           ? const Color.fromARGB(255, 238, 238, 238)
    //                           : const Color(0xff1652A4),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15),
    //                 ),
    //               ],
    //             ),
    //             Column(
    //               children: [
    //                 Text(
    //                   "د . أحمد عبدالله",
    //                   style: TextStyle(
    //                       color: darkmode!
    //                           ? const Color.fromARGB(255, 238, 238, 238)
    //                           : const Color(0xff1652A4),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15),
    //                 ),
    //                 Text("قسم تراكيبات",
    //                     style: TextStyle(
    //                         color: darkmode!
    //                             ? const Color.fromARGB(255, 238, 238, 238)
    //                             : const Color(0xff1652A4),
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15)),
    //               ],
    //             ),
    //           ],
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15),
    //           child: Divider(
    //             thickness: 1,
    //             height: 20,
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Row(
    //               children: [
    //                 Icon(Icons.calendar_month,
    //                     color: darkmode! ? Colors.white : Color(0xff1652A4)),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   "12/01/2023",
    //                   style: TextStyle(
    //                     color: darkmode!
    //                         ? const Color.fromARGB(255, 238, 238, 238)
    //                         : Colors.black,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Icon(Icons.access_time_filled,
    //                     color: darkmode! ? Colors.white : Color(0xff1652A4)),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   "10:30 AM",
    //                   style: TextStyle(
    //                       color: darkmode!
    //                           ? const Color.fromARGB(255, 238, 238, 238)
    //                           : Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 15,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             InkWell(
    //               onTap: () {},
    //               child: Container(
    //                 width: 130,
    //                 padding: const EdgeInsets.symmetric(vertical: 12),
    //                 decoration: BoxDecoration(
    //                   color: const Color(0xFFF4F6FA),
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: const Center(
    //                   child: Text(
    //                     "حذف",
    //                     style: TextStyle(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w500,
    //                         color: Colors.black),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             MyButtom(
    //               onPressed: () {},
    //               title: "تفاصيل",
    //               bcColor: const Color(0xff1652A4),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //       ],
    //     ),

    //   ),
    // );
  }
}
