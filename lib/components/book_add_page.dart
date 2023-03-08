// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mybook/components/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:mybook/auth/login.dart';
// import 'package:scroll_navigation/scroll_navigation.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bookaddscreen extends StatefulWidget {
  const bookaddscreen({super.key});

  @override
  State<bookaddscreen> createState() => _bookaddscreenState();
}

class _bookaddscreenState extends State<bookaddscreen> {
  late String book_name;
  late String author_name;
  late String short_discription;
  late String long_discription;
  final db = FirebaseFirestore.instance;
  final prefs = SharedPreferences.getInstance();

  // get current => null;
  var current_user = 'seenuthiruvpm@gmail.com';
  adddata() async {
    shareget();
    // FirebaseFirestore.instance.collection("events").doc(book_name).set({
    //   'book_name': book_name,
    //   'author_name': author_name,
    //   'short_discription': short_discription,
    //   'long_discription': long_discription,

    // });

    final dataget =
        await FirebaseFirestore.instance.collection("events").doc("data").get();
    final unitdata = dataget.data() as Map<String, dynamic>;
    print(dataget['book_name']);
  }

  Future<String?> shareget() async {
    final prefs = await SharedPreferences.getInstance();

    final String? username = prefs.getString('name');
    setState(() {
      final user_name = username;
    });
    FirebaseFirestore.instance.collection("events").doc(book_name).set({
      'poster_name': username,
      'book_name': book_name,
      'author_name': author_name,
      'short_discription': short_discription,
      'long_discription': long_discription,
    });
    return username;
  }

  Future<String> getuser() async {
    final prefs = await SharedPreferences.getInstance();

    final String? user = prefs.getString('name');
    setState(() {
      var current_user = user;
    });
    return user.toString();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AlertDialog(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close))
          ],
          title: const Text('Book add'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    book_name = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter book name.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    author_name = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter author name.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    short_discription = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter short dicription of the book.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  minLines: 7,
                  maxLines: 20,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    long_discription = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter long discription of the app.')),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(onPressed: adddata, child: Text('save')),
            ],
          ),
        ),
      ),
    );
  }
}
