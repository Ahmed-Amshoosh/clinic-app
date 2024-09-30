import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key,
      required this.image,
      required this.title,
      required this.ontap});
  final String image;
  final String title;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            
            ),
      width: 160,
      height: 120,
      child: InkWell(
        onTap: ontap,
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(171, 0, 0, 0),
            ),
          ),
          Center(
              child: Text(
            title.tr(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ))
        ]),
      ),
    );
  }
}
