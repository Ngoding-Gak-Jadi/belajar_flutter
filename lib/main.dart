import 'package:belajar_flutter/content/detail_page.dart';
import 'package:belajar_flutter/login_screen.dart';
import 'package:belajar_flutter/page.dart';
import 'package:belajar_flutter/signup_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1a94ff)),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signin': (context) => const SignUpScreen(),
        '/home': (context) => MyHomePage(userEmail: 'Guest', userPass: '-'),
        '/animeDetail': (context) => const AnimeDetailPage(title: "Default"),
      },
    );
  }
}
