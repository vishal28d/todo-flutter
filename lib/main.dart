// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // init the hive
await Hive.initFlutter() ;

// ceate a box 
 var box = await Hive.openBox('myBox');

runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}