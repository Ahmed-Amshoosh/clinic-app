// ignore_for_file: camel_case_types, file_names, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/appointment/Appointment.dart';

import '../../controller/modeController.dart';
import '../../widgets/Mybottom.dart';

class complatedAppintmen extends StatefulWidget {
  const complatedAppintmen({super.key});

  @override
  State<complatedAppintmen> createState() => _complatedAppintmenState();
}

class _complatedAppintmenState extends State<complatedAppintmen> {
  List data = [];
  bool loading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("appointment")
        .where("state", isEqualTo: true)
        .get();
    // .get();
    // await FirebaseFirestore.instance.collection("infouser").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
    loading = false;
  }
List datau = [];
  datauser() async {
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
    getData();datauser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : data.isEmpty
            ? Center(
                child: Text(
                "there_are_no_completed_dates".tr(),
                style: const TextStyle(fontSize: 30, color: Color(0xff1654A2)),
              ))

            :datau[0]['statUs'] ==1?
             SingleChildScrollView(
               child: Container(
                 height: MediaQuery.of(context).size.height - 160,
                 child: ListView.builder(
                   itemCount: data.length,
                   itemBuilder: (context, index) {
                     return InkWell(
                       onTap: () {
                         showDialog(
                             context: context,
                             builder: (context) => AlertDialog(
                                   title: Icon(
                                     Icons.warning,
                                     size: 70,
                                     color: darkmode!
                                         ? const Color.fromARGB(
                                             255, 238, 238, 238)
                                         : const Color(0xff1652A4),
                                   ),
                                   content: Text(
                                     "do_you_want_to_delete_this_notification"
                                         .tr(),
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                         color: darkmode!
                                             ? const Color.fromARGB(
                                                 255, 238, 238, 238)
                                             : const Color(0xff1652A4),
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold),
                                   ),
                                   actions: [
                                     Row(
                                       mainAxisAlignment:
                                           MainAxisAlignment.center,
                                       children: [
                                         MyButtom(
                                           title: "yes".tr(),
                                           onPressed: () async {
                                             await FirebaseFirestore.instance
                                                 .collection("appointment")
                                                 .doc(data[index].id)
                                                 .delete();
                                             setState(() {});
                                           
                                             Navigator.pushReplacement(
                                                 // ignore: use_build_context_synchronously
                                                 context,
                                                 MaterialPageRoute(
                                                     builder:
                                                         (context) =>
                                                             const MyAppointment()));
                                           },
                                           bcColor: const Color(0xff1652A4),
                                         ),
                                         const SizedBox(
                                           width: 20,
                                         ),
                                         MyButtom(
                                             title: "no".tr(),
                                             onPressed: () {
                                               Navigator.pop(context);
                                             },
                                             bcColor:
                                                 const Color(0xff1652A4)),
                                       ],
                                     )
                                   ],
                                   backgroundColor: darkmode!
                                       ? const Color.fromARGB(
                                           181, 41, 40, 40)
                                       : const Color.fromARGB(
                                           255, 238, 238, 238),
                                 ));
                       },
                       child: Container(
                           width: double.infinity,
                           margin: const EdgeInsets.all(5),
                           height: 80,
                           decoration: BoxDecoration(
                               color: darkmode!
                                   ? const Color.fromARGB(255, 190, 189, 189)
                                   : Colors.white,
                               border: Border.all(
                                 color: const Color.fromARGB(15, 0, 31, 68),
                               ),
                               borderRadius: BorderRadius.circular(10)),
                           child: Container(
                             alignment: Alignment.center,
                             child: ListTile(
                               leading: Text("${1 + index}",
                                   style: const TextStyle(
                                       fontSize: 18,
                                       color: Color(0xff1652A4))),
                               title: Text(data[index]['name'],
                                   style: const TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: Color(0xff1652A4))),
                               trailing: Text(data[index]['appoint'],
                                   style: const TextStyle(
                                       fontSize: 15,
                                       color: Color(0xff1652A4))),
                             ),
                           )),
                     );
                   },
                 ),
               ),
             ):Center(child: Text("${data.length} ${"appointment_completed".tr()}" ,style: const TextStyle(color: Color(0xff1654A2),fontSize: 20,fontWeight: FontWeight.bold),),);
  }
}
// Container(
//                 // width: 200,
//                 height: 800,
//                 child: ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (context, index) {
//                     print(data.length);
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         color: Colors.white,
//                         child: Container(
//                           color: Colors.white,
//                           child: ListTile(
//                             // isThreeLine: true,

//                             title: Text(data[index]['name'],
//                                 style: TextStyle(
//                                     fontSize: 18, color: Color(0xff1652A4))),
//                             leading: Text(
//                               "${index + 1}",
//                               style: TextStyle(
//                                   fontSize: 18, color: Color(0xff1652A4)),
//                             ),
//                             trailing: Text(data[index]['appoint'],
//                                 style: TextStyle(
//                                     fontSize: 15, color: Color(0xff1652A4))),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
