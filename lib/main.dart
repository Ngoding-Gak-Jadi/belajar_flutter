// import 'package:belajar_flutter/content/detail_page.dart';
import 'package:belajar_flutter/home_page.dart';
// import 'package:belajar_flutter/login_screen.dart';
// import 'package:belajar_flutter/page.dart';
// import 'package:belajar_flutter/signup_screen.dart';
// import 'package:belajar_flutter/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomePage()
    );
  }
}
