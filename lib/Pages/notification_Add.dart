// ignore_for_file: must_be_immutable, empty_catches, avoid_unnecessary_containers, file_names, depend_on_referenced_packages, camel_case_types, prefer_const_constructors_in_immutables, avoid_print


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/post/posts.dart';
import 'package:path/path.dart';
import '../../widgets/Mybottom.dart';
// import 'validatAuth.dart';
import 'package:intl/intl.dart';
class notification_Add extends StatefulWidget {
  notification_Add({super.key});

  @override
  State<notification_Add> createState() => _AddPostState();
}

class _AddPostState extends State<notification_Add> {
  TextEditingController title = TextEditingController();

  TextEditingController desc = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();

  CollectionReference post = FirebaseFirestore.instance.collection('post');

  Future<void> addUser() {

    return post
        .add({
          // 'id': '111',
          'id': FirebaseAuth.instance.currentUser!.uid,
          'title': title.text, // John Doe
          'desc': desc.text, // John Doe
          'image': url,
          'time': DateFormat.jms().format(DateTime.now()), // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    // }
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
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

                      Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "انشاء اشعار ",
                style: TextStyle(
                    color: Color(0xff1652A4),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
                      const SizedBox(height: 20,),
    
                      Image.asset(
                        "images/logo.png",
                        height: 130,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: title,
                        decoration: InputDecoration(
                          hintText: "الاشعار",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 1, 77, 184)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 1, 77, 184)),
                          ),
                        ),
                      ),
                      
    
                    
    
                      const SizedBox(
                        height: 40,
                      ),
                      MyButtom(
                          title: "أنشاء اشعار ",
                          onPressed: () async {
                            if (formstate.currentState!.validate()) {
                              try {
                              
    
                                if (title.text != '' || desc.text != '') {
                                  
                                  
                                  addUser();
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Posts()));
                                }
    
                              
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
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc:
                                        'الحساب موجود بالفعل لهذا البريد الإلكتروني.',
                                  ).show();
                                }
                              } catch (e) {
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        width: 340,
                                        animType: AnimType.bottomSlide,
                                        title: 'خطاء',
                                        desc: "$e",
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
    );
  }
}
