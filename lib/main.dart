import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/Auth/signup.dart';
import 'package:graduation_project/Pages/doctors/doctors.dart';
import 'package:graduation_project/Pages/home.dart';
import 'package:graduation_project/Pages/onBoarding/onboarding.dart';
import 'package:graduation_project/Pages/post/posts.dart';
import 'package:graduation_project/controller/modeController.dart';
import 'package:graduation_project/t1.dart';
import 'package:graduation_project/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Auth/login.dart';
import 'package:http/http.dart' as http;

// import 'firebase_options.dart';
SharedPreferences? mode;
SharedPreferences? lang;
String? languge;
bool? start;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  SharedPreferences mode = await SharedPreferences.getInstance();
  darkmode = (mode.getBool("mode") ?? false);

  SharedPreferences lang = await SharedPreferences.getInstance();
  languge = lang.getString("lang") ?? "ar";
SharedPreferences starapp = await SharedPreferences.getInstance();
  start = starapp.getBool("starapp") ?? false;
  runApp(EasyLocalization(
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'translations',
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String lang=
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return MaterialApp(
      // locale: lang.getString('lang') == null ? Locale(lang.getString('lang').toString()) : Locale('ar'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,

      locale: context.locale,

      // localizationsDelegates: [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,

      title: 'Welcome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null ?start! ?const Login(): const Screen() : const Home(),
      // home:Doctors(),

      routes: {
        "login": (context) => const Login(),
        "signup": (context) => SignUp(),
      },
    );
  }
}
