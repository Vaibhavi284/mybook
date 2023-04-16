// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mybook/auth/auth.dart';
import 'package:mybook/components/provider.dart';
import 'package:mybook/screens/chat.dart';
import 'package:provider/provider.dart';
import 'package:mybook/screens/book_add_page.dart';
import 'package:mybook/screens/book_list.dart';
import 'package:mybook/screens/my_book.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    context.read<Getcurrentuser>().getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Getcurrentuser>(
        builder: ((context, Getcurrentuser, child) => MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("Welcome"),
                  centerTitle: true,
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        //child: Text('Drawer Header'),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Welcome'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('${Getcurrentuser.userName}'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text('add book'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const bookaddscreen()));
                        },
                      ),
                      ListTile(
                        title: const Text('My book'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mybooklist()));
                        },
                      ),
                      ListTile(
                        title: const Text('Book List'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const booklist()));
                        },
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                        ListTile(
                        title: const Text('chat'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const chatscreen()));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 150),
                        margin: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 252, 250),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 110.0),
                            Text('Welcome ...',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            SizedBox(height: 40.0),
                            Text(
                                'unleash your skill, write book discription here',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            SizedBox(height: 40.0),
                            Image.asset("assets/book.jpeg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
