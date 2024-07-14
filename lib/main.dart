import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/signup.dart';
import 'screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Origin Oracle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/predict': (context) => const PredictionScreen()
      },
    );
  }
}
