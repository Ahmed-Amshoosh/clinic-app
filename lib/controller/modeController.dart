// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

// class ModeController {


  
// }
storMode() async {
    SharedPreferences mode = await SharedPreferences.getInstance();
    darkmode = mode.getBool("mode") == null ?false:true;
  }
bool? darkmode;
// storLang() async {
//     SharedPreferences lang = await SharedPreferences.getInstance();
//     languge = lang.getString("lang") == null ?"ar":"en";
//   }
// bool? languge;