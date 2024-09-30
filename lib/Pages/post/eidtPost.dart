// ignore_for_file: must_be_immutable, empty_catches, avoid_unnecessary_containers, unnecessary_null_comparison, file_names, unnecessary_import, avoid_print, prefer_if_null_operators, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/post/posts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../widgets/Mybottom.dart';
// import 'validatAuth.dart';
import 'package:intl/intl.dart';

class EidtPost extends StatefulWidget {
  const EidtPost(
      {super.key,
      required this.id,
      required this.title,
      required this.desc,
      required this.image});

  final String id;
  final String title;
  final String desc;
  final String image;

  @override
  State<EidtPost> createState() => _AddPostState();
}

class _AddPostState extends State<EidtPost> {
  TextEditingController title = TextEditingController();

  TextEditingController desc = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();

  CollectionReference post = FirebaseFirestore.instance.collection('post');
bool loading = false;
  addUser() async {
    if (flie == null) {
      await post
          .doc(widget.id)
          .update({
            'id': FirebaseAuth.instance.currentUser!.uid,
            'title': title.text, // John Doe
            'desc': desc.text, // John Doe
            'time': DateFormat.jms().format(DateTime.now()), // John Doe
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } else {
      await post
          .doc(widget.id)
          .update({
            'id': FirebaseAuth.instance.currentUser!.uid,
            'title': title.text, // John Doe
            'desc': desc.text, // John Doe
            'image': url != null ?url:'',
            'time': DateFormat.jms().format(DateTime.now()), // John Doe
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  @override
  void initState() {
    title.text = widget.title;
    desc.text = widget.desc;
    // flie = ;
    super.initState();
  }

  File? flie;

  var imageName = '';
  var url;
  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageCamra =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageCamra != null) {
      flie = File(imageCamra.path);
      imageName = basename(imageCamra.path);
      // url=await
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     child: const Text(
          //       "أنشاء مقالة ",
          //       style: TextStyle(
          //           color: Color(0xff1652A4),
          //           fontWeight: FontWeight.bold,
          //           fontSize: 25),
          //     ),
          //   ),
          // ),

          body: loading ?const Center(child: CircularProgressIndicator(),):
           Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Form(
          key: formstate,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      "make_post".tr(),
                      style: const TextStyle(
                          color: Color(0xff1652A4),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "images/logo.png",
                    height: 130,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "title_post".tr(),
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
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: desc,
                    decoration: InputDecoration(
                      hintText: "desc_post".tr(),
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
                  TextButton(
                      onPressed: () async {
                        await getImage();
                      },
                      child: Text("img_post".tr())),
                  if (widget.image != null) Image.network(widget.image),
                  if (flie != null) Image.file(flie!),
                  const SizedBox(
                    height: 40,
                  ),
                  MyButtom(
                      title: "make_post".tr(),
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          try {
                            loading = true;
                            setState(() {
                                
                              });
                            if (title.text != '' || desc.text != '') {
                              if (flie != null) {
                                var refstorge =
                                    FirebaseStorage.instance.ref(imageName);
                                await refstorge.putFile(flie!);
                                url = await refstorge.getDownloadURL();
                              }

                              addUser();
                              loading = false;
                              setState(() {
                                
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Posts()));
                            }
                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context).pop();
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'كلمة المرور المقدمة ضعيفة جدًا.',
                              ).show();
                            } else if (e.code == 'email-already-in-use') {
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
