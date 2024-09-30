// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:graduation_project/Pages/Auth/login.dart';
import 'package:graduation_project/Pages/appointment/make_appointment.dart';
import 'package:graduation_project/Pages/doctors/doctors.dart';
import 'package:graduation_project/Pages/notice.dart';
import 'package:graduation_project/Pages/post/posts.dart';
// import 'package:graduation_project/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/modeController.dart';
import '../widgets/category.dart';
import 'appointment/Appointment.dart';

// ignore: camel_case_types
class Home_Categroy extends StatefulWidget {
  const Home_Categroy({super.key});

  @override
  State<Home_Categroy> createState() => _aState();
}

// ignore: camel_case_types
class _aState extends State<Home_Categroy> {
  List datau = [];
  datauser() async {
    loading = true;
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

  bool loading = false;
  int activeIndex = 0;
  final images = [
    "images/dc1.jpg",
    "images/dc2.jpg",
    "images/dc3.jpg",
  ];

  @override
  void initState() {
    super.initState();
    datauser();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
        loading ? const Center(
                            child: CircularProgressIndicator()):
       Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("images/doctor1.jpg"),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      datau.isNotEmpty?
                      "title".tr()+datau[0]['name']:"title".tr(),
                      // "ddddd",
                    
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkmode!
                            ? const Color.fromARGB(255, 238, 238, 238)
                            : const Color(0xff1652A4),
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () async {
                      // GoogleSignIn googleSignIn = GoogleSignIn();
                      // googleSignIn.disconnect();
                      // await FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Notices()));
                    },
                    icon: Icon(
                      Icons.notification_add,
                      color: darkmode!
                          ? const Color.fromARGB(255, 238, 238, 238)
                          : const Color(0xff1652A4),
                    ))
              ],
            ),
          ),
        
        
        

          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = images[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                  height: 400,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          buildIndicator(),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Category(
                  image: "images/dc3.jpg",
                  
                   title:"make_appoint",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Make_Appointment()));
                  }),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Category(
                    image: "images/smartphone.jpg",
                  
                    title:"appointment",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAppointment()));
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Category(
                  image: "images/doctor3.jpg",
                  title: "doctors",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const Doctors()));
                  }),
              const SizedBox(
                width: 10,
              ),
              Category(
                  image: "images/notic.jpg",
                  title: "medical_Advice",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Posts()));
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          width: double.infinity,
          urlImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: const ExpandingDotsEffect(
            dotHeight: 8, dotWidth: 8, activeDotColor: Colors.blue),
      );
}
