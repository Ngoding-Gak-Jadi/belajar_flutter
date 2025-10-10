import 'package:belajar_flutter/providers/favorites_provider.dart';
import 'package:belajar_flutter/providers/history_provider.dart';
import 'package:belajar_flutter/screens/auth/signin_screen.dart';
import 'package:belajar_flutter/screens/auth/signup_screen.dart';
import 'package:belajar_flutter/screens/splash_screen.dart';
import 'package:belajar_flutter/widgets/main_navigation_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
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
        '/home': (context) => const MainNavigationScreen(
          userName: '',
          userEmail: '',
          userPass: '',
        ),
      },
    );
  }
}
