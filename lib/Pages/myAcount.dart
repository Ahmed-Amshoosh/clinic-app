// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, unused_local_variable, avoid_function_literals_in_foreach_calls, avoid_print, use_build_context_synchronously, empty_catches
import 'package:easy_localization/easy_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:graduation_project/widgets/Mybottom.dart';
import 'package:graduation_project/widgets/textformfeildAppoint.dart';

import '../controller/modeController.dart';
import 'colors/colors.dart';

class MyAcount extends StatefulWidget {
  const MyAcount({super.key});

  @override
  State<MyAcount> createState() => _MyAcountState();
}

class _MyAcountState extends State<MyAcount> {
  TextEditingController userName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  List<dynamic> data = [];
  bool loading = true;

  // getData() async {
  //   QuerySnapshot querySnapshot =
  //   //await FirebaseFirestore.instance
  //   //     .collection("infouser")
  //   //     .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       // .get();
  //       await FirebaseFirestore.instance.collection("infouser").get();
  //   data.add(querySnapshot.docs);
  //   setState(() {});
  //   loading = false;
  // }
  // getData() async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection("infouser")
  //       .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       data.add(element.data());
  //       data.add({'doc': element.id});
  //     });
  //     setState(() {});
  //     return value;
  //   });
  //   //data.addAll(querySnapshot.docs);
  //   setState(() {});
  // }

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("infouser")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        data.add(element.data());
        data.add({'doc': element.id});
      });
      // userName.text = data[2]['name'].toString();
      // city.text = data[0]['city'].toString();
      if (data.isEmpty) {
        userName.text = "";
        email.text = FirebaseAuth.instance.currentUser!.email.toString();
        phone.text = "";
        city.text = "";
        password.text = "";
      } else {
        userName.text = data[0]['name'].toString();
        email.text = data[0]['email'].toString();
        phone.text = data[0]['phone'].toString();
        city.text = data[0]['city'].toString();
        password.text = data[0]['password'].toString();
      }

      setState(() {});
      loading = false;
      return value;
    });
    //data.addAll(querySnapshot.docs);
    setState(() {});
  }

//request.auth != null
  CollectionReference infouser =
      FirebaseFirestore.instance.collection('infouser');
  String a = FirebaseAuth.instance.currentUser!.uid;

  Future<void> updateUser() async {
    return infouser
        .doc(data[1]['doc'].toString())
        .update({
          'name': userName.text,
          "phone": phone.text,
          "city": city.text,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // UpdateUser() async{

  // CollectionReference infouser =
  //     FirebaseFirestore.instance.collection('infouser');
  //    infouser.doc(FirebaseAuth.instance.currentUser!.uid).update({
  //     // 'id': FirebaseAuth.instance.currentUser!.uid,
  //     'name': "userName.text", // John Doe
  //     'city': city.text, // Stokes and Sons
  //     'phone': phone.text, // 42
  //     'email': email.text, // 42
  //     'password': password.text // 42
  //   });
  // }

  @override
  void initState() {
    getData();
    // print(FirebaseAuth.instance.currentUser!.uid);

    //userName.text = data['name'].toString();
    //city.text = data['city'];
    // userAge.text = data[0]['name'];

    // username.text = "احمد عبدالله";
    // email.text = "amshoosh1@gmail.com";
    // phoneNum.text = "772913602";
    // city.text = "سيئون";
    // password.text = "772913602";

    super.initState();
  }

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
          "profile".tr(),
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
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text(data[0]['name'].toString()),
                    // Text(data[0]['city'].toString()),
                    // Text(data[0]['phone'].toString()),
                    // Text(),
                    // Container(
                    //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                    //     child: Text("$data")),
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/doctor3.jpg"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextFormFieldAppoint(
                        hinttext: "name".tr(),
                        myIcon: Icons.person,
                        controller: userName,
                        isNumber: false,
                        readonly: false,
                        maxline: 1),
                    const SizedBox(
                      height: 15,
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: MyTextFormFieldAppoint(
                          hinttext: "email".tr(),
                          myIcon: Icons.email,
                          controller: email,
                          readonly: false,
                          maxline: 1),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextFormFieldAppoint(
                        hinttext: "phone".tr(),
                        controller: phone,
                        isNumber: true,
                        myIcon: Icons.phone,
                        readonly: false,
                        maxline: 1),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextFormFieldAppoint(
                      hinttext: "city".tr(),
                      controller: city,
                      isNumber: false,
                      readonly: false,
                      maxline: 1,
                      myIcon: Icons.place,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: MyTextFormFieldAppoint(
                        // isNumber: false,
                        hinttext: "password".tr(),
                        controller: password,
                        readonly: false,
                        maxline: 1,
                        myIcon: Icons.password,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButtom(
                        title: "Save_changes".tr(),
                        onPressed: () async {
                          try {
                            await updateUser();
                              showDialog(
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
                          
                              "the_modifications_have_been_saved".tr(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xff1652A4),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );

                    
                          } catch (e) {
                          }
                        },
                        bcColor: const Color(0xff1652A4))
                  ],
                ),
              ),
            ),
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
