import 'package:belajar_flutter/screens/auth/signin_screen.dart';
import 'package:belajar_flutter/screens/auth/signup_screen.dart';
import 'package:belajar_flutter/screens/splash_screen.dart';
import 'package:belajar_flutter/screens/main_navigation_screen.dart';
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
        '/home': (context) => const MainNavigationScreen(),
      },
    );
  }
}
