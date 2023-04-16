// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mybook/components/provider.dart';
import 'package:mybook/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final newuser = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
          title: "Mybook",
          onSignup: (data) async {
            try {
              final newuser = await _auth.createUserWithEmailAndPassword(
                  email: data.name.toString(),
                  password: data.password.toString());
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(data.name)
                  .set({
                'name': data.name,
                'password': data.password,
              });
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('name', data.name.toString());
              await prefs.setString('password', data.name.toString());

              if (newuser != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              }
            } catch (e) {
              print(e);
            }
          },
          onLogin: (data) async {
            try {
              final user = await _auth.signInWithEmailAndPassword(
                  email: data.name.toString(),
                  password: data.password.toString());
              if (user != null) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', data.name.toString());
                await prefs.setString('password', data.name.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              }
            } catch (e) {
              print(e);
            }
          },
          onRecoverPassword: (data) {},
          onSubmitAnimationCompleted: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MyApp()),
              )),
    );
  }
}
