// ignore_for_file: avoid_print, prefer_is_empty, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/Mybottom.dart';

import '../controller/modeController.dart';
import 'colors/colors.dart';
import 'package:intl/intl.dart';

// ipa

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  CollectionReference notice = FirebaseFirestore.instance.collection('notice');

  TextEditingController title = TextEditingController();

  List data = [];

  List datau = [];

  bool loading = false;

  getData() async {
    loading = true;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("notice").get();
    // await FirebaseFirestore.instance.collection("infouser").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
    loading = false;
    setState(() {});
  }

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

  Future<void> addUser() {
    return notice
        .add({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'title': title.text, // John Doe
          'time': DateFormat.jms().format(DateTime.now()), // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  int stateus = 0;
  @override
  void initState() {
    super.initState();
    getData();
    fetchData();
    datauser();
  }

  //     if (datau[0]['statUs'] == 1) {
  //   stateus = (datau[0]['statUs'] == 1) as int;
  // } else {
  //   stateus = (datau[0]['statUs'] == 0) as int;
  // }

  // -==================================================================
  List<dynamic> notices = [];

  // دالة لجلب البيانات من API
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.120.27:8000/api/notices'));

    if (response.statusCode == 200) {
      // تحويل النص JSON إلى كائن Dart
      setState(() {
        notices = json.decode(response.body);
      });
    } else {
      // في حال فشل الطلب
      throw Exception('Failed to load data');
    }
  }
  // =================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading:

          title: Text(
            "notifications".tr(),
            style: TextStyle(
                fontSize: 25,
                color: darkmode!
                    ? const Color.fromARGB(255, 238, 238, 238)
                    : const Color(0xff1652A4),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,

          actions: [
            loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // : datau[0]['statUs'] == 1
                : false
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11)),
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: 180,
                                    margin: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          maxLines: 2,
                                          controller: title,
                                          decoration: InputDecoration(
                                            hintText: "notice_text".tr(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      34, 1, 77, 184)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 1, 77, 184)),
                                            ),
                                          ),
                                        ),

                                        // TextButton(onPressed: (){}, child: Text("ارسال"))
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        MyButtom(
                                            title: "send".tr(),
                                            onPressed: () {
                                              if (title.text != "") {
                                                addUser();

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Notices()));
                                              }
                                            },
                                            bcColor: const Color(0xff1654A2))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => notification_Add()));
                        },
                        icon: Icon(
                          Icons.notification_add,
                          color: darkmode!
                              ? Colors.white
                              : const Color(0xff1654A2),
                          size: 30,
                        ))
                    : const Text("")
          ],
        ),
        backgroundColor: darkmode!
            ? bacgroundDarkMode
            : const Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                data.length == 0
                    ? Column(
                        children: [
                          Image.asset(
                            "images/notices1.webp",
                            width: 200,
                          ),
                          Text(
                            "${"there_are_no_notifications".tr()} !!! ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: darkmode!
                                  ? const Color.fromARGB(255, 238, 238, 238)
                                  : const Color(0xff1652A4),
                            ),
                          ),
                        ],
                      )
                    :

                    //
                    // =================================== Notices of doctors===========================================
                    //
                    loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height -
                                120, // height: 100,
                            child: ListView.builder(
                                itemCount: notices.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    // onTap: () async {
                                    //   showDialog(
                                    //       context: context,
                                        
                                    //       builder: (context) => AlertDialog(
                                    //             title: Icon(
                                    //               Icons.warning,
                                    //               size: 70,
                                    //               color: darkmode!
                                    //                   ? const Color.fromARGB(
                                    //                       255, 238, 238, 238)
                                    //                   : const Color(0xff1652A4),
                                    //             ),
                                    //             content: Text(
                                    //               "do_you_want_to_delete_this_notification"
                                    //                   .tr(),
                                    //               textAlign: TextAlign.center,
                                    //               style: TextStyle(
                                    //                   color: darkmode!
                                    //                       ? const Color
                                    //                           .fromARGB(255,
                                    //                           238, 238, 238)
                                    //                       : const Color(
                                    //                           0xff1652A4),
                                    //                   fontSize: 20,
                                    //                   fontWeight:
                                    //                       FontWeight.bold),
                                    //             ),
                                    //             actions: [
                                    //               Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .center,
                                    //                 children: [
                                    //                   MyButtom(
                                    //                     title: "yes".tr(),
                                    //                     onPressed: () async {
                                    //                       await FirebaseFirestore
                                    //                           .instance
                                    //                           .collection(
                                    //                               "notice")
                                    //                           .doc(data[index]
                                    //                               .id)
                                    //                           .delete();
                                    //                       setState(() {});
                                    //                       Navigator.pushReplacement(
                                    //                           context,
                                    //                           MaterialPageRoute(
                                    //                               builder:
                                    //                                   (context) =>
                                    //                                       const Notices()));
                                    //                     },
                                    //                     bcColor: const Color(
                                    //                         0xff1652A4),
                                    //                   ),
                                    //                   const SizedBox(
                                    //                     width: 20,
                                    //                   ),
                                    //                   MyButtom(
                                    //                       title: "no".tr(),
                                    //                       onPressed: () {
                                    //                         Navigator.pop(
                                    //                             context);
                                    //                       },
                                    //                       bcColor: const Color(
                                    //                           0xff1652A4)),
                                    //                 ],
                                    //               )
                                    //             ],
                                    //             backgroundColor: darkmode!
                                    //                 ? const Color.fromARGB(
                                    //                     181, 41, 40, 40)
                                    //                 : const Color.fromARGB(
                                    //                     255, 238, 238, 238),
                                    //           ));
                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: darkmode!
                                              ? const Color.fromARGB(
                                                  255, 192, 189, 189)
                                              : const Color.fromARGB(
                                                  255, 223, 219, 219),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  45, 21, 79, 160)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: darkmode!
                                                    ? const Color.fromARGB(
                                                        255, 223, 219, 219)
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                blurRadius: darkmode! ? 1 : 20,
                                                offset: darkmode!
                                                    ? const Offset(0, 1)
                                                    : const Offset(20, 21)),
                                          ]),
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "images/doctor2.jpg",
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  // alignment: Alignment.center,
                                                  width: 250,
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(
                                                    notices[index]['notice'],
                                                    maxLines: 7,
                                                    textAlign: TextAlign.right,
                                                  )),
                                              Text(
                                                DateFormat('yyyy/MM/dd')
                                                    .format(
                                                        DateTime.parse(notices[
                                                                index][
                                                            'created_at']) // Parse the String to DateTime
                                                        ),
                                              )
                                              // Text(formatDate(notices[index]['created_at']))
                                              // ,Icon(Icons.abc),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })),
              ],
            ),
          ),
        ));
  }
}
