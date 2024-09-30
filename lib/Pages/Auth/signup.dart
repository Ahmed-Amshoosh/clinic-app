// ignore_for_file: must_be_immutable, empty_catches, avoid_unnecessary_containers, unused_local_variable, avoid_print, use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/Auth/login.dart';
import 'package:graduation_project/Pages/home.dart';

import '../../widgets/Mybottom.dart';
import '../../widgets/myInkWell.dart';
import '../../widgets/textformfeild.dart';
import 'validatAuth.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
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
    return infouser //Ol7oRkz7I8Ng8UfndLrfT1sJAl42
        .add({
          // 'id': '111',
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': username.text, // John Doe
          'city': city.text, // Stokes and Sons
          'phone': phoneNum.text, // 42
          'email': email.text, // 42
          'password': password.text, // 42
          'statUs':0
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
// ryQsca2GCDrmmd7E7wpm
// dlkBQVX1MYPwt6nEZqdrfrtYacl1
// dlkBQVX1MYPwt6nEZqdrfrtYacl1


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Container(
              margin: const EdgeInsets.only(top: 20),
              child:  Text(
              "create_a_new_account".tr(),
                style: const TextStyle(
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
    
                      Image.asset(
                        "images/logo.png",
                        height: 130,
                      ),
                      MyTextFormField(
                        // validator: (val) {
                          // return validInput(val!, 5, 20, "username");
                        // },
                        validator: (name)=>name!.isEmpty?"لايمكن ان يكون اسم المستخدم فارغ":null,
                        hinttext:"user_name".tr(),
                        controller: username,
                      ),
                      MyTextFormField(
                        validator: (val) {
                          return validInput(val!, 8, 20, "email");
                        },
                        hinttext:"email".tr(),
                        controller: email,
                      ),
                      MyTextFormField(
                        validator: (val) {
                          return validInput(val!, 7, 20, "phone");
                        },
                        hinttext:"phone".tr(),
                        controller: phoneNum,
                      ),
                      MyTextFormField(
                        // validator: (val) {
                        //   return validInput(val!, 2, 10, "city");
                        // },
                        validator: (name)=>name!.isEmpty?"لايمكن ان يكون اسم المستخدم فارغ":null,
                        hinttext:"city".tr(),
                        controller: city,
                      ),
                      MyTextFormField(
                        validator: (val) {
                          return validInput(val!, 6, 20, "password");
                        },
                        hinttext:"password".tr(),
                        controller: password,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MyButtom(
                          title:"create_account".tr(),
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
                                final credential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                addUser();
                                Navigator.pushReplacement(
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
                                    desc: "the_password_provided_is_too_weak".tr(),
                                  ).show();
                                } else if (e.code ==
                                    'email-already-in-use') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title:"error".tr(),
                                    desc:
                                      "the_account_already_exists_for_this_email".tr(),
                                  ).show();
                                }
                              } catch (e) {
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        width: 340,
                                        animType: AnimType.bottomSlide,
                                        title: "error".tr(),
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
                      Container(
                          child: const Text(
                        "ــــــــــــــــــــOr Login With ــــــــــــــــــــــ",
                        style: TextStyle(color: Colors.grey),
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "images/facebook.png",
                                ),
                              )),
                          Container(
                              margin: const EdgeInsets.all(10),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "images/google.png",
                                ),
                              )),
                          Container(
                              margin: const EdgeInsets.all(10),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "images/apple.png",
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyInkWell(
                        title:"you_already_have_an_account".tr(),
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
