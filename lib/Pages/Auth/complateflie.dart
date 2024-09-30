// ignore_for_file: must_be_immutable, empty_catches, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print, duplicate_ignore, unnecessary_brace_in_string_interps

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/home.dart';

import '../../widgets/Mybottom.dart';
import '../../widgets/textformfeild.dart';
import 'validatAuth.dart';

class ComplateFile extends StatelessWidget {
  ComplateFile({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();

  CollectionReference infouser =
      FirebaseFirestore.instance.collection('infouser');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return infouser
        .add({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': username.text, // John Doe
          'city': city.text, // Stokes and Sons
          'phone': phoneNum.text, // 42
          // 'email': email.text, // 42
          'password': password.text // 42
        })
        // ignore: avoid_print
        .then((value) => print("User Added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    " ",
                    style: TextStyle(
                        color: Color(0xff1652A4),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Form(
                  key: formstate,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(height: 50,),
const Text(
                    "اكمال البيانات الشخصية ",
                    style: TextStyle(
                        color: Color(0xff1652A4),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(height: 20,),
                          Image.asset(
                            "images/logo.png",
                            height: 130,
                          ),
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 5, 20, "username");
                            },
                            hinttext: "اسم المستخدم ",
                            controller: username,
                          ),
                      
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 7, 20, "phone");
                            },
                            hinttext: "رقم الجوال",
                            controller: phoneNum,
                          ),
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 2, 10, "city");
                            },
                            hinttext: "المنطقة",
                            controller: city,
                          ),
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 6, 20, "password");
                            },
                            hinttext: "كلمة المرور",
                            controller: password,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MyButtom(
                              title: "التالي  ",
                              onPressed: () async {
                                if (formstate.currentState!.validate()) {
                                  try {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        });
                                    addUser();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  } on FirebaseAuthException catch (e) {
                                    Navigator.of(context).pop();
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'Error',
                                        desc: 'كلمة المرور المقدمة ضعيفة جدًا.',
                                      ).show();
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      // ignore: avoid_single_cascade_in_expression_statements
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'Error',
                                        desc:
                                            'الحساب موجود بالفعل لهذا البريد الإلكتروني.',
                                      )..show();
                                    }
                                  } catch (e) {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            width: 340,
                                            animType: AnimType.bottomSlide,
                                            title: 'خطاء',
                                            desc: "${e}",
                                            btnOkOnPress: () {},
                                            btnOkColor: const Color(0xff1654A2))
                                        .show();
                                    print(e);
                                  }
                                } else {
                                  print("not validet");
                                }
                              },
                              bcColor: const Color(0xff1652A4)),

                          const SizedBox(
                            height: 30,
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}
