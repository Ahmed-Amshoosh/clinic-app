// ignore_for_file: file_names

import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      
    
// if (val.length == null) {
//         return "o ";
//       }  if (val.length < min) {
//         return "too ";
//       }
      return "لايمكن ان يكون اسم المستخدم فارغ ";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "لايمكن ان يكون حقل الجيميل  فارغ";
    }
  }

  if (type == "city") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون حقل المنطقة  فارغ";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون رقم الجوال  فارغ";
    }
  }
  if (val.isEmpty) {
    return "لايمكن ان يكون هذا الحقل  فارغ";
  }
  if (val.length < min) {
    return "لا يمكن ان يكون اقل  $min احرف";
  }
  if (val.length > max) {
    return "لا يمكن ان يكون اكبر  $max احرف";
  }

  if (type == "password") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون حقل المنطقة  فارغ";
    }
  }

  if (type == "problem") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون حقل المنطقة  فارغ";
    }
  }

  if (type == "age") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون حقل المنطقة  فارغ";
    }
  }

    if (type == "date") {
    if (!GetUtils.isUsername(val)) {
      return "لايمكن ان يكون حقل المنطقة  فارغ";
    }
  }
  
}
