// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mybook/auth/login.dart';
import 'package:mybook/components/book_add_page.dart';
import 'package:mybook/components/book_list.dart';
import 'package:mybook/components/my_book.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 166, 24, 194), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String book_name;
  late String author_name;
  late String short_discription;
  late String long_discription;
  final db = FirebaseFirestore.instance;
  final prefs = SharedPreferences.getInstance();
  
  // get current => null;
var current_user= 'seenuthiruvpm@gmail.com';
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

  
 Future<String> getuser()async{
 final prefs = await SharedPreferences.getInstance();
                    
                    final String? user = prefs.getString('name');
                    setState(() {
                      var current_user= user;
                      
                    });
                    return user.toString();

}
   
get current => current_user;
@override
  initState() {
    getuser();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text('add book'),
                
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const bookaddscreen()));
                },
              ),
              ListTile(
                title: const Text('My book'),
                
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const mybooklist()));
                },
              ),
              ListTile(
                title: const Text('Book List'),
                
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const booklist()));
                },
              ),
              
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        body: TitleScrollNavigation(
          bodyStyle: NavigationBodyStyle(
            background: Colors.white,
            // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          barStyle: TitleNavigationBarStyle(
            style: TextStyle(fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            // spaceBetween: 40,
          ),
          titles: [
            "Add book",
            "My book list",
            "Books list",
          ],
          pages: [
            /* page 1 */
            Center(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Hi user add your book "),
                  ElevatedButton(
                      onPressed: () {
    
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return 
                              
                              SingleChildScrollView(
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
                                          decoration:
                                              kTextFieldDecoration.copyWith(
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
                                          decoration:
                                              kTextFieldDecoration.copyWith(
                                                  hintText:
                                                      'Enter author name.')),
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
                                              hintText:
                                                  'Enter short dicription of the book.')),
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
                                              hintText:
                                                  'Enter long discription of the app.')),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      ElevatedButton(
                                          onPressed: adddata,
                                          child: Text('save')),
                                    ],
                                  ),
                                ),
                              );
                            });
                     
                      },
                      child: Text('add')),
                ],
              ),
            )),
    
            /* page 2 */
    
            Container(
              child: StreamBuilder<QuerySnapshot> (
                // stream: db.collection('events').snapshots(),
                
                 stream: db.collection('events').where("poster_name", isEqualTo:'seenuthiruvpm@gmail.com' ).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      // child: Text('data not found'),
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      // reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
    
                      children: snapshot.data!.docs.map((doc) {
                        return Card(
                          child: ListTile(
                            title: Text(doc['book_name']),
                            subtitle: Text(doc['author_name']),
                            trailing: IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("events")
                                      .doc(doc['book_name'])
                                      .delete();
                                },
                                icon: Icon(Icons.remove)),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: AlertDialog(
                                        actions: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.close))
                                        ],
                                        title: const Text('Book detail'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Book name",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['book_name']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Author name",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['author_name']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Short discription",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['short_discription']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Long discription",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['long_discription']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
    
    /* page 3 */
    
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('events').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      // child: Text('data not found'),
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      // reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
    
                      children: snapshot.data!.docs.map((doc) {
                        return Card(
                          child: ListTile(
                            title: Text(doc['book_name']),
                            subtitle: Text(doc['author_name']),
                            trailing: IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("events")
                                      .doc(doc['book_name'])
                                      .delete();
                                },
                                icon: Icon(Icons.remove)),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: AlertDialog(
                                        actions: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.close))
                                        ],
                                        title: const Text('Book detail'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Book name",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['book_name']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Author name",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['author_name']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Short discription",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['short_discription']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Long discription",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 27,
                                            ),
                                            Text(doc['long_discription']),
                                            SizedBox(
                                              height: 35,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            )
    
            // Container(color: Colors.green[100]),
            // Container(color: Colors.purple[100]),
            // Container(color: Colors.amber[100]),
            // Container(color: Colors.deepOrange[100])
          ],
        ),
      ),
    );
  }
}
