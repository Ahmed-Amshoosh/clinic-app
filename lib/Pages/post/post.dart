import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../controller/modeController.dart';
import '../colors/colors.dart';

class Post extends StatefulWidget {
  const Post(
      {super.key,
      required this.time,
      required this.title,
      required this.desc,
      required this.image,
      required this.name});
  final String time;
  final String title;
  final String desc;
  final String image;
  final String name;
  // late String time;

  @override
  State<Post> createState() => _PostsState();
}

class _PostsState extends State<Post> {
  CollectionReference post = FirebaseFirestore.instance.collection('post');

  List data = [];
  List datau = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
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
            "medical_Advice".tr(),
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
        // stsat body=================================
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "images/doctor5.jpg",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(widget.name,
                                      style: TextStyle(
                                          color: darkmode!
                                              ? const Color.fromARGB(
                                                  255, 238, 238, 238)
                                              : const Color(0xff1652A4),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  Text(
                                    widget.time,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(30),
                              alignment: Alignment.topRight,
                              child: Text(
                                widget.title,
                                style: TextStyle(
                                    color: darkmode!
                                        ? const Color.fromARGB(
                                            255, 238, 238, 238)
                                        : const Color(0xff1652A4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                          Container(
                              // padding: const EdgeInsets.all(30),
                              // width: 90,
                              // alignment: Alignment.topRight,
                              child: Html(data: widget.desc)),
                          // Text(
                          //   widget.desc,
                          //   style: TextStyle(
                          //       color: darkmode!
                          //           ? const Color.fromARGB(
                          //               255, 238, 238, 238)
                          //           : const Color.fromARGB(
                          //               255, 34, 92, 173),
                          //       // fontWeight: FontWeight.bold,
                          //       fontSize: 14),
                          // )),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              // 'http://192.168.31.97:8000/images//${widget.image}',
                              widget.image,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
