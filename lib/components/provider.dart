



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getcurrentuser with ChangeNotifier{

 Future<dynamic> getuser() async {
    final prefs = await SharedPreferences.getInstance();

    final String? user = prefs.getString('name');
    
    print(user);
    
    notifyListeners();
   return user;
  }


}