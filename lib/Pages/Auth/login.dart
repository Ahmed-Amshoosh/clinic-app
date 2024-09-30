// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, use_build_context_synchronously, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/Pages/Auth/signup.dart';
import 'package:graduation_project/Pages/Auth/validatAuth.dart';

import '../../widgets/Mybottom.dart';
import '../../widgets/myInkWell.dart';
import '../../widgets/textformfeild.dart';
import '../home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool loading = false;
  CollectionReference infouser =
      FirebaseFirestore.instance.collection('infouser');
  addUser() async {
    await infouser
        .add({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': "", // John Doe
          'city': "", // Stokes and Sons
          'phone': "", // 42
          'email': "", // 42
          'password': "", // 42
          'statUs': 0
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    loading = false;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    loading = true;

    await FirebaseAuth.instance.signInWithCredential(credential);
    addUser();
    // Navigator.push(context, route)
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const Home()));
  }

  String p = "";
  String e = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // builder: EasyLoading.init(),
          body: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "login".tr(),
                            style: const TextStyle(
                                color: Color(0xff1652A4),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Image.asset(
                            "images/logo.png",
                            height: 130,
                          ),
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 8, 20, "email");
                            },
                            hinttext: "email".tr(),
                            controller: email,
                          ),
                          Text(e),
                          MyTextFormField(
                            validator: (val) {
                              return validInput(val!, 6, 20, "password");
                            },
                            hinttext: "password".tr(),
                            controller: password,
                          ),
                          Text(p),
                          const SizedBox(
                            height: 20,
                          ),
                          // MyInkWell(
                          //   title: "نسيت كلمة المرور",
                          //   ontap: () {},
                          //   alignment: Alignment.centerRight,
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          MyButtom(
                            title: "login".tr(),
                            bcColor: const Color(0xff1652A4),
                            onPressed: () async {
                              // if (email.text == "" || password.text == "") {
                              //   AwesomeDialog(
                              //     context: context,
                              //     dialogType: DialogType.error,
                              //     animType: AnimType.rightSlide,
                              //     title: 'error'.tr(),
                              //     desc:
                              //         'لا يمكن ان يكون حقل الجيميل او كلمة المرور فارغ.',
                              //   ).show();
                              // }
                              // loading = true;
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              try {
                                // loading = true;
                                setState(() {});
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              } on FirebaseAuthException catch (e) {
                                Navigator.of(context).pop();
                                // loading = true;

                                if (e.code == 'user-not-found') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc:
                                        "the_account_already_exists_for_this_email"
                                            .tr(),
                                  ).show();
                                  // return 'No user found for that email.';
                                } else if (e.code == 'wrong-password') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc:
                                        "the_account_already_exists_for_this_email"
                                            .tr(),
                                  ).show();
                                  // AwesomeDialog(
                                  //         context: context,
                                  //         dialogType: DialogType.error,
                                  //         width: 340,
                                  //         animType: AnimType.bottomSlide,
                                  //         title: 'خطاء',
                                  //         desc:
                                  //             'Wrong password provided for that user.',
                                  //         btnOkOnPress: () {},
                                  //         btnOkColor: Color(0xff1654A2))
                                  //     .show();
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: "the_email_or_password_is_incorrect"
                                        .tr(),
                                  ).show();
                                }
                              }
                            },
                          ),
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
                              InkWell(
                                onTap: () {
                                  signInWithGoogle();
                                },
                                child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "images/google.png",
                                      ),
                                    )),
                              ),
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
                            title: "create_a_new_account".tr(),
                            ontap: () {
                              // Navigator.pushReplacementNamed((context), "signup");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
