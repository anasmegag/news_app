import 'package:flutter/material.dart';
import 'package:football_app/view/pages/HomePage.dart';
import 'package:get/get.dart';
main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(category: 'general',country: 'us',)
    );
  }
}

