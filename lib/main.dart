// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, curly_braces_in_flow_control_structures, unused_import, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mybook/auth/login.dart';
import 'package:mybook/components/provider.dart';
import 'package:mybook/components/screen.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MultiProvider(providers: [

ChangeNotifierProvider(create: (_) => Getcurrentuser())

  ],
  child: MaterialApp(home: MyApp()),
  ));
}






// import 'package:flutter/material.dart';

// void main() {
//   runApp(const TabBarDemo());
// }

// class TabBarDemo extends StatelessWidget {
//   const TabBarDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: const TabBar(
//               tabs: [
// //                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//             title: const Text('Tabs Demo'),
//           ),
//           body: const TabBarView(
//             children: [
// //               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







/* 


flutter pub add scroll_navigation


@override
Widget build(BuildContext context) {
  return ScrollNavigation(
    bodyStyle: NavigationBodyStyle(
      background: Colors.white,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
    barStyle: NavigationBarStyle(
      background: Colors.white,
      elevation: 0.0,
    ),
    pages: [
      Container(color: Colors.blue[100]),
      Container(color: Colors.green[100]),
      Container(color: Colors.purple[100]),
      Container(color: Colors.amber[100]),
      Container(color: Colors.deepOrange[100])
    ],
    items: const [
      ScrollNavigationItem(icon: Icon(Icons.camera)),
      ScrollNavigationItem(icon: Icon(Icons.chat)),
      ScrollNavigationItem(icon: Icon(Icons.favorite)),
      ScrollNavigationItem(icon: Icon(Icons.notifications)),
      ScrollNavigationItem(icon: Icon(Icons.home))
    ],
  );
} */

// @override
// Widget build(BuildContext context) {
//   return 

//   ScrollNavigation(
//     bodyStyle: NavigationBodyStyle(
//       background: Colors.white,
//       borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//     ),
//     barStyle: NavigationBarStyle(
//       background: Colors.white,
//       elevation: 0.0,
//     ),
//     pages: [
//       Container(color: Colors.blue[100]),
//       Container(color: Colors.green[100]),
//       Container(color: Colors.purple[100]),
//       Container(color: Colors.amber[100]),
//       Container(color: Colors.deepOrange[100])
//     ],
//     items: const [
//       ScrollNavigationItem(icon: Icon(Icons.camera)),
//       ScrollNavigationItem(icon: Icon(Icons.chat)),
//       ScrollNavigationItem(icon: Icon(Icons.favorite)),
//       ScrollNavigationItem(icon: Icon(Icons.notifications)),
//       ScrollNavigationItem(icon: Icon(Icons.home))
//     ],
//   );


// } 