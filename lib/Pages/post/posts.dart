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
// ipa

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
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

  List<dynamic> posts = [];

  // دالة لجلب البيانات من API
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.120.27:8000/api/posts'));

    if (response.statusCode == 200) {
      // تحويل النص JSON إلى كائن Dart
      setState(() {
        posts = json.decode(response.body);
      });
    } else {
      // في حال فشل الطلب
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // getData();
    fetchData();
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
              : false
              // : datau[0]['statUs'] == 1
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
                : posts.isEmpty
                    ? const Center(
                        child: Text(
                          "لاتوجد نصايح طبية",
                          style: TextStyle(
                              color: Color(0xff1654A2),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )
                    :
                     SizedBox(
                        height: MediaQuery.of(context).size.height - 120,
                        child: ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Post(
                                              name: datau[0]['name'],
                                              short_desc: posts[index]['short_desc'],
                                              big_desc: posts[index]['big_desc'],
                                              image: posts[index]['image'],
                                              time: posts[index]['created_at'],
                                              title: posts[index]['title'],
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
                                                          ? 
                                                              datau[0]['name']
                                                          : '',
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
                                                    DateFormat('yyyy/MM/dd')
                                                    .format(
                                                        DateTime.parse(posts[
                                                                index][
                                                            'created_at']) // Parse the String to DateTime
                                                        ),
                                                 
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          false == 1
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
                                                                                data[index]['short_desc'],
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
                                                posts[index]['title'],
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
                                              posts[index]['short_desc'],
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
                                              'http://192.168.120.27:8000/images/${posts[index]['image']}',
                                            
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
