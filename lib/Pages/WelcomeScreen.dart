// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(child: Image.asset("images/pro2.png")),
              ),
              const Text(
                "تطبيق مجاني",
                style: TextStyle(
                    color: Color(0xff1652A4),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 280,
                child: const Text(
                  "أطباء اسنان تىحت اشراف اخصائيين واستشتريين في جامعة الاجزهر في اليمن ",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                  color: const Color.fromARGB(255, 52, 40, 85),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 52, 40, 85))),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 13),
                  child: const Text(
                    "التالي",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 52, 40, 85),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 114, 90, 180),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 114, 90, 180),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 114, 90, 180),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
