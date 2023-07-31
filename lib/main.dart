import 'package:flutter/material.dart';
import 'screens/initial_screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(),
            bodyLarge: TextStyle(
                color: Color(0xffF6F6F6),
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w600,
                fontSize: 31),
            displayMedium: TextStyle(
                color: Color(0xffF6F6F6),
                fontFamily: 'Metropolis',
                fontSize: 22),
            bodyMedium: TextStyle(
                color: Color(0xffF6F6F6),
                fontWeight: FontWeight.w500,
                fontFamily: 'Metropolis',
                fontSize: 16),
            displaySmall: TextStyle(
                color: Color(0xffF6F6F6),
                fontWeight: FontWeight.w500,
                fontFamily: 'Metropolis',
                fontSize: 15),
            bodySmall: TextStyle(
                color: Color(0xffF6F6F6),
                fontFamily: 'Metropolis',
                fontSize: 13),
            titleLarge: TextStyle(
                color: Color(0xffF5F5F5),
                fontFamily: 'Metropolis',
                fontSize: 31),
            titleSmall: TextStyle(
                color: Color(0xffF5F5F5),
                fontFamily: 'Metropolis',
                fontSize: 13),
            labelMedium: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                fontSize: 13),
            labelSmall: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Metropolis',
                fontSize: 10),
          )),
      home: const SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
