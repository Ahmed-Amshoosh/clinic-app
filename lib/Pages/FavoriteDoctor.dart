// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../controller/modeController.dart';
import 'colors/colors.dart';

class FavoriteDoctor extends StatefulWidget {
  const FavoriteDoctor({super.key});

  @override
  State<FavoriteDoctor> createState() => _FavoriteDoctorState();
}

class _FavoriteDoctorState extends State<FavoriteDoctor> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
        backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
          appBar: AppBar(
            // elevation: ,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),
                )),
            title:  Text(
              "المفظلة ",
              style: TextStyle(
                  fontSize: 20,
              color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4),

                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
              backgroundColor: darkmode! ? bacgroundDarkMode: Colors.white,
          ),
          
          body: Container(
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                        Container(
                      padding: const EdgeInsets.all( 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromARGB(69, 154, 173, 216))
                        // color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Row(
                            
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/doctor3.jpg",
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 30,),
                               Column(
                                children: [
                                  Text("ahmed amshoosh",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Text("Dentist" ,style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      Text("4.8",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                                  
                                    ],
                                  )
                                ],
                              ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 70,left: 10),
                                child: IconButton(onPressed: (){},
                                 icon:  Icon(Icons.favorite_border_outlined,size: 30,color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                              )
                            ],
                          ),
                        
                        
                        ],
                      ),
                    ),
                  
                      const SizedBox(height: 20,),
                    
                    Container(
                      padding: const EdgeInsets.all( 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromARGB(69, 154, 173, 216))
                        // color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Row(
                            
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/doctor3.jpg",
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 30,),
                               Column(
                                children: [
                                  Text("ahmed amshoosh",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Text("Dentist" ,style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      Text("4.8",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                                  
                                    ],
                                  )
                                ],
                              ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 70,left: 10),
                                child: IconButton(onPressed: (){},
                                 icon:  Icon(Icons.favorite_border_outlined,size: 30,color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                              )
                            ],
                          ),
                        
                        
                        ],
                      ),
                    ),
                  
                    const SizedBox(height: 20,),
                    
                        Container(
                      padding: const EdgeInsets.all( 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromARGB(69, 154, 173, 216))
                        // color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Row(
                            
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/doctor3.jpg",
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 30,),
                               Column(
                                children: [
                                  Text("ahmed amshoosh",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Text("Dentist" ,style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4)),
),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      Text("4.8",style:TextStyle(   color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                                  
                                    ],
                                  )
                                ],
                              ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 70,left: 10),
                                child: IconButton(onPressed: (){},
                                 icon:  Icon(Icons.favorite_border_outlined,size: 30,color: darkmode! ?  const Color.fromARGB(255, 238, 238, 238):  const Color(0xff1652A4))),
                              )
                            ],
                          ),
                        
                        
                        ],
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
