// ignore_for_file: camel_case_types, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/Mybottom.dart';
import 'package:graduation_project/widgets/textformfeild.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  CollectionReference test = FirebaseFirestore.instance.collection('test');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return test
        .add({
          // 'id': FirebaseAuth.instance.currentUser!.uid,
          'name': username.text, // John Doe
          'city': email.text, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          MyTextFormField(
            hinttext: "اسم المستخدم ",
            controller: username,
          ),
          MyTextFormField(
            hinttext: "اسم المستخدم ",
            controller: email,
          ),
          MyButtom(
              title: "title",
              onPressed: () {
                addUser();
              },
              bcColor: Colors.red)
        ],
      ),
    );
  }
}
