// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/Pages/Auth/login.dart';
import 'package:graduation_project/Pages/myAcount.dart';
import 'package:graduation_project/widgets/Mybottom.dart';
import 'package:graduation_project/widgets/itemsetting.dart';

import '../controller/modeController.dart';
import 'DarkMode.dart';
import 'Language.dart';
import 'colors/colors.dart';

class Setting extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

List<String> modes = ["فاتح", "داكن"];


class _SettingState extends State<Setting> {
  String selectItem = modes[0];
  
@override
  void setState(VoidCallback fn) {
  
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
    
      appBar: AppBar(
        
        title:  Text(
        "setting".tr(),
          style: TextStyle(
              fontSize: 20,
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
          backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
    
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: const CircleAvatar(
                maxRadius: 60,
                backgroundImage: AssetImage(
                  "images/person1.PNG",
                ),
              )),
          // Text(
          //   "ahmed amshoosh",
          //   style: TextStyle(fontWeight: FontWeight.bold,color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color.fromARGB(255, 17, 17, 17)),
          // ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyAcount()));
              },
              child:  const ItemSetting(
                  myicon: Icons.person_2_outlined, tilte:"profile")),
          // InkWell(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const FavoriteDoctor()));
          //     },
          //     child: const ItemSetting(
          //         myicon: Icons.favorite_border_outlined,
          //         tilte: "المفظلة")),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Language()));
              },
              child:  const ItemSetting(myicon: Icons.language, tilte: "lang")),
          InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const DarkMode()));
                // showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(
                //           title: Icon(
                //             Icons.exit_to_app,
                //             size: 70,
                //             color: Color(0xff1652A4),
                //           ),
                //           content: Container(
                //             child: Column(
                //               children: [
                //                 ListTile(
                //                   title: Text("فاتح"),
                //                   leading: Radio(
                //                     value: modes[0],
                //                     groupValue: selectItem,
                //                     onChanged: (val) {
                //                       selectItem = val.toString();
                //                     },
                //                   ),
                //                 ),
                //                   ListTile(
                //                   title: Text("فاتح"),
                //                   leading: Radio(
                //                     value: modes[1],
                //                     groupValue: selectItem,
                //                     onChanged: (val) {
                //                       selectItem = val.toString();
                //                     },
                //                   ),
                //                 ),
                //                 // RadioListTile(
                //                 //     title: Text("فاتح"),
                //                 //     value: modes[0],
                //                 //     groupValue: selectItem,
                //                 //     onChanged: (val) {
                //                 //       setState(() {
                //                 //         selectItem = val.toString();
                //                 //       });
                //                 //     }),
                //                 // RadioListTile(
                //                 //     title: Text("داكن"),
                //                 //     value: modes[1],
                //                 //     groupValue: selectItem,
                //                 //     onChanged: (val) {
                //                 //       setState(() {
                //                 //         selectItem = val.toString();
                //                 //       });
                //                 //     })
                //               ],
                //             ),
                //           ),
                //           backgroundColor: Colors.white,
                //         ));
              
              },
              child:  const ItemSetting(
                  myicon: Icons.mode_night_outlined,
                  tilte:"dark_mode")),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      
                          title: Icon(
                            Icons.exit_to_app,
                            size: 70,
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
                          ),
                          content:  Text(
                           "messgeLogout".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButtom(
                                  title: "yes",
                                  onPressed: () async {
                      GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
              },
                                  bcColor: const Color(0xff1652A4),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                MyButtom(
                                    title:"no",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    bcColor: const Color(0xff1652A4)),
                              ],
                            )
                          ],
                          backgroundColor:darkmode! ? const Color.fromARGB(181, 41, 40, 40): const Color.fromARGB(255, 238, 238, 238),
    
                        ));
              },
              child:  const ItemSetting(
                  myicon: Icons.exit_to_app, tilte:"log_out")),
        ],
      ),
    );
  }
}
