import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getcurrentuser with ChangeNotifier, DiagnosticableTreeMixin {
  static String? user = "";
  static String? password= "";

  String? get userName => user;

  void getuser() async {
    final prefs = await SharedPreferences.getInstance();

    user = prefs.getString('name');
    password = prefs.getString('password');

    

    notifyListeners();
  }
}
