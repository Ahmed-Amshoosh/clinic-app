import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../controller/modeController.dart';
import '../colors/colors.dart';
// import 'package:share_plus/share_plus.dart'; 
import 'package:path_provider/path_provider.dart'; // To save the image locally
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  const Post(
      {super.key,
      required this.time,
      required this.title,
      required this.image,
      required this.name,
      required this.short_desc,
      required this.big_desc});
  final String time;
  final String title;
  final String short_desc;
  final String big_desc;
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

  File? _imageFile;
  Future<void> _downloadImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final filePath =
        '${documentDirectory.path}/shared_image.png'; // Saving image locally
    final file = File(filePath);

    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes);
      setState(() {
        _imageFile = file;
      });
    } else {
      print('Failed to download image');
    }
  }

  // Future<void> _shareContent() async {
  //   if (_imageFile != null) {
  //     Share.shareFiles([_imageFile!.path],
  //         text: widget.short_desc); // Share image and text
  //   } else {
  //     print('Image file is null');
  //   }
  // }

  


  @override
  void initState() {
    // TODO: implement initState
    _downloadImage(
        'http://192.168.120.27:8000/images/${widget.image}'); // Download image when the widget is created

    super.initState();
  }

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
                                    DateFormat('yyyy/MM/dd')
                                        .format(DateTime.parse(
                                      widget.time,
                                    ) // Parse the String to DateTime
                                            ),
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
                              child: Html(data: widget.short_desc)),
                          Container(
                              padding: const EdgeInsets.only(top: 30),
                              // width: 90,
                              // alignment: Alignment.topRight,
                              child: Html(data: widget.big_desc)),
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
                              // widget.image,
                              'http://192.168.120.27:8000/images/${widget.image}',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     // Share image and text
                          //     // _shareContent();
                          //   },
                          //   child: Text('Share Post'),
                          // ),
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
