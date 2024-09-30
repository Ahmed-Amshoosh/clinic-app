// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/post/addPost.dart';
import 'package:graduation_project/Pages/post/eidtPost.dart';
import 'package:graduation_project/Pages/post/post.dart';
import 'package:readmore/readmore.dart';

import '../../controller/modeController.dart';
import '../colors/colors.dart';
import 'package:http/http.dart' as http;

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}
class Album {
  final int id;
  final String title;
  final String desc;
  final String image;

  const Album({
    required this.id,
    required this.desc,
    required this.image,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'desc': String desc,
        'image': String image,
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          desc: desc,
          image: image,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('http://192.168.31.97:8000/api/post'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class _PostsState extends State<Posts> {
  CollectionReference post = FirebaseFirestore.instance.collection('post');

  List data = [];
  List datau = [];
  bool loading = false;

  getData() async {
    loading = true;

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("post").get();
    // await FirebaseFirestore.instance.collection("infouser").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
    loading = false;
    setState(() {});
  }

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
    getData();
    datauser();
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => AddPost()));
      //   },
      //   child: Icon(Icons.add),
      // ),
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
        actions: [
          loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : datau[0]['statUs'] == 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPost()));
                      },
                      icon: const Icon(
                        Icons.add_comment,
                        color: Color(0xff1654A2),
                      ))
                  : const Text('')
        ],
      ),
      // stsat body=================================
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : data.isEmpty
                    ? const Center(
                        child: Text(
                          "لاتوجد نصايح طبية",
                          style: TextStyle(
                              color: Color(0xff1654A2),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 120,
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Post(
                                              name: datau[0]['name'],
                                              desc: data[index]['desc'],
                                              image: data[index]['image'],
                                              time: data[index]['time'],
                                              title: data[index]['title'],
                                            )));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: darkmode!
                                        ? const Color.fromARGB(181, 41, 40, 40)
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 158, 158, 158),
                                          blurRadius: 2,
                                          spreadRadius: -1,
                                          offset: Offset(1.1, 1))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  Text(
                                                      datau.isNotEmpty
                                                          ? "title".tr() +
                                                              datau[0]['name']
                                                          : "title".tr(),
                                                      style: TextStyle(
                                                          color: darkmode!
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  238, 238, 238)
                                                              : const Color(
                                                                  0xff1652A4),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17)),
                                                  Text(
                                                    data[index]['time']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          datau[0]['statUs'] == 1
                                              ? Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          EidtPost(
                                                                            id: data[index].id,
                                                                            title:
                                                                                data[index]['title'],
                                                                            desc:
                                                                                data[index]['desc'],
                                                                            image:
                                                                                data[index]['image'],
                                                                          )));
                                                        },
                                                        // Icons.more_vert_rounded,
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: darkmode!
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  238, 238, 238)
                                                              : const Color(
                                                                  0xff1652A4),
                                                        )),
                                                    IconButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "post")
                                                              .doc(data[index]
                                                                  .id)
                                                              .delete();
                                                          setState(() {});
                                                          if (data[index]
                                                                  ['image'] !=
                                                              'none') {
                                                            FirebaseStorage
                                                                .instance
                                                                .refFromURL(data[
                                                                        index]
                                                                    ['image'])
                                                                .delete();
                                                          }
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Posts()));
                                                        },
                                                        // Icons.more_vert_rounded,
                                                        icon: Icon(
                                                          Icons.delete,
                                                          color: darkmode!
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  238, 238, 238)
                                                              : const Color(
                                                                  0xff1652A4),
                                                        )),
                                                  ],
                                                )
                                              : const Center()
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10, top: 5),
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                data[index]['title'],
                                                style: TextStyle(
                                                    color: darkmode!
                                                        ? const Color.fromARGB(
                                                            255, 238, 238, 238)
                                                        : const Color(
                                                            0xff1652A4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              )),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 5),
                                            alignment: Alignment.topRight,
                                            child: ReadMoreText(
                                              // trimLines: 6,
                                              // maxLines: 3,
                                              // overflow: TextOverflow.visible,
                                              data[index]['desc'],
                                              style: TextStyle(
                                                  color: darkmode!
                                                      ? const Color.fromARGB(
                                                          255, 238, 238, 238)
                                                      : const Color.fromARGB(
                                                          255, 34, 92, 173),
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              data[index]['image'],
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Row(
                                          //       children: [
                                          //         IconButton(
                                          //           onPressed: () {},
                                          //           icon: Icon(
                                          //             Icons.add,
                                          //             size: 30,
                                          //             color: darkmode!
                                          //                 ? const Color
                                          //                     .fromARGB(255,
                                          //                     238, 238, 238)
                                          //                 : const Color(
                                          //                     0xff1652A4),
                                          //           ),
                                          //         ),
                                          //         Text(
                                          //           "100",
                                          //           style: TextStyle(
                                          //             color: darkmode!
                                          //                 ? const Color
                                          //                     .fromARGB(255,
                                          //                     238, 238, 238)
                                          //                 : const Color(
                                          //                     0xff1652A4),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     IconButton(
                                          //       onPressed: () {},
                                          //       icon: Icon(
                                          //         Icons.share,
                                          //         color: darkmode!
                                          //             ? const Color.fromARGB(
                                          //                 255, 238, 238, 238)
                                          //             : const Color(0xff1652A4),
                                          //       ),
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                        
                          },
                        )),
          ],
        ),
      ),
    );
  }
}
