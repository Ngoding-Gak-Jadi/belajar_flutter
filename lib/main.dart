import 'package:belajar_flutter/providers/favorites_provider.dart';
import 'package:belajar_flutter/screens/auth/signin_screen.dart';
import 'package:belajar_flutter/screens/auth/signup_screen.dart';
import 'package:belajar_flutter/screens/splash_screen.dart';
import 'package:belajar_flutter/widgets/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
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
        '/home': (context) => const MainNavigationScreen(userEmail: '', userPass: '',),
      },
    );
  }
}
