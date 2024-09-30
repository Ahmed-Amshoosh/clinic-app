// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/colors/colors.dart';
import 'package:graduation_project/controller/modeController.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsDetails extends StatefulWidget {
  const DoctorsDetails(
      {super.key,
      required this.name,
      required this.image,
      required this.cat,
      required this.exper,
      required this.sick,
      required this.eval, required this.location});
  final String name;
  final String image;
  final String cat;
  final String exper;
  final String sick;
  final String eval;
  final String location;

  @override
  State<DoctorsDetails> createState() => _DoctorsState();
}

class _DoctorsState extends State<DoctorsDetails> {
  // Future<void> urLauncher(String url) async {
  //   final Uri _url = Uri.parse(url);
  //   if (await canLaunchUrl(_url)) {
  //     await launch(url);
  //   } else {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final Uri url = Uri.parse('https://flutter.dev');
    // Future<void> _launchUrl() async {
    //   if (!await launchUrl(url)) {
    //     throw Exception('Could not launch $url');
    //   }
    // }

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // backgroundColor: const Color(0xFF7165D6),
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
              
                widget.name,
                style: TextStyle(
                    fontSize: 25,
                    color: darkmode!
                        ? const Color.fromARGB(255, 238, 238, 238)
                        : const Color(0xff1652A4),
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: darkmode!
                  ? bacgroundDarkMode
                  : Color.fromARGB(255, 253, 253, 253) // Colors.white,
                  ,
            // backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
              // elevation: ,
              ),
          // backgroundColor: darkmode! ? bacgroundDarkMode : Colors.white,
      backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(widget.image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2)),
                                ),
                                Text(
                                  widget.cat,
                                  style: TextStyle(
                                      fontSize: 18,
color:darkmode! ? const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98),                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "اليمن , حضرموت , سيئون",
                                  style: TextStyle(
                                      fontSize: 18,
color:darkmode! ? const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98),                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // const Text(
                            //   "Dr.Doctor Name",
                            //   style: TextStyle(
                            //       fontSize: 23,
                            //       fontWeight: FontWeight.w500,
                            //       color: Colors.white),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // const Text(
                            //   "Therapist",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w500, color: Colors.white),
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(10),
                            //       decoration: const BoxDecoration(
                            //           color: Color(0xFF9F97E2),
                            //           shape: BoxShape.circle),
                            //       child: const Icon(
                            //         Icons.call,
                            //         size: 25,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 20,

                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(10),
                            //       decoration: const BoxDecoration(
                            //           color: Color(0xFF9F97E2),
                            //           shape: BoxShape.circle),
                            //       child: const Icon(
                            //         CupertinoIcons.chat_bubble_text_fill,
                            //         size: 25,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Divider(
                      color: Color.fromARGB(255, 221, 221, 221),
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(162, 192, 220, 252),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.people_alt,
                            size: 28,
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2)
                
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(
                          "${widget.sick}+",
                          style: TextStyle(
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                         Text(
                          "مرضى",
                          style: TextStyle(
                color:darkmode! ? const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98),                                fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(162, 192, 220, 252),
                              borderRadius: BorderRadius.circular(50)),
                          child:  Icon(
                            Icons.cases_outlined,
                            size: 28,
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(
                          "${widget.exper}+",
                          style: TextStyle(
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                         Text(
                          "سنوات خبرة",
                          style: TextStyle(
                              color:darkmode! ?const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(162, 192, 220, 252),
                              borderRadius: BorderRadius.circular(50)),
                          child:  Icon(
                            Icons.star,
                            size: 28,
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(
                        "${widget.eval}+",
                          style: TextStyle(
                            color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                         Text(
                          "تقييم",
                          style: TextStyle(
                color:darkmode! ? const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98),                                fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                    padding: const EdgeInsets.only(right: 40, top: 10),
                    child: Text(
                      " نبذة :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                              color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                          ),
                    )),

                Container(
                  padding: const EdgeInsets.only(right: 40, left: 15),
                  child: Text(
                    "الطبيب الذي درس طب الأسنان، ويعالجها في المجالات المختلفة والإختصاصات المختلفة. وطب الأسنان هو جزء من طب الفم، وهو فرع من فروع الطب التي تشارك في التقييم والوقاية والتشخيص والمعالجة الجراحية أو غير الجراحية لاضطرابات وأمراض وظروف تجويف الفم والوجه والفكين والمنطقة المتاخمة لها والمرتبطة بها وتأثيرها على الجسم البشري.",
                    style: TextStyle(
                        fontSize: 17, color:darkmode! ? const Color.fromARGB(255, 206, 206, 206): const Color.fromARGB(255, 99, 98, 98)),
                  ),
                ),
                // Text("data"),

                Container(
                    padding: const EdgeInsets.only(right: 40, top: 10, bottom: 20),
                    child: Text(
                      " مواقع التواصل  :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                              color:darkmode!? const Color.fromARGB(255, 59, 144, 247):const Color(0xff1654A2),
                          ),
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('https://fasebook.com'));
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("images/facebook.png"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('mailto:amshoosh2@gmail.com'));
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("images/gmail.png"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('tel:967772913602'));
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/phone.png"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('https://wa.me/967772913601'));
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("images/w.jpg"),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height / 1.5,
                //   width: double.infinity,
                //   padding: const EdgeInsets.only(left: 15, top: 20),
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(10),
                //       topRight: Radius.circular(10),
                //     ),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       const Text(
                //         "About Doctor",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       const Text(
                //         "Another exception was thrown: Unable to load asset",
                //         style: TextStyle(fontSize: 16, color: Colors.black54),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),

                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
