import 'dart:io';
import 'package:flutter/material.dart';
import 'models/products.dart';
import 'screens/initial_screens/splash.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Color(0xffF6F6F6),
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w600,
                fontSize: 44),
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
                fontWeight: FontWeight.w600,
                fontFamily: 'Metropolis',
                fontSize: 16),
            displaySmall: TextStyle(
                color: Color(0xffF6F6F6),
                fontWeight: FontWeight.w500,
                fontFamily: 'Metropolis',
                fontSize: 14.5),
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
                fontWeight: FontWeight.w400,
                fontSize: 13),
            labelMedium: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                fontSize: 13),
            labelSmall: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400,
                fontSize: 10),
          )),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Product> favouriteList = [];
String? name, email, userId;
