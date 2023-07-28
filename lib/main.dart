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
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  color: Color(0xffF6F6F6),
                  fontFamily: 'Metropolis',
                  fontSize: 30))),
      home: const SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
