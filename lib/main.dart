import 'package:belajar_flutter/login_screen.dart';
import 'package:belajar_flutter/page.dart';
import 'package:belajar_flutter/signin_screen.dart';
import 'package:belajar_flutter/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaizNation',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 21, 21)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signin': (context) => const SigninScreen(),
        '/home': (context) => MyHomePage(userEmail: '', userPass: ''),
      },
    );
  }
}
