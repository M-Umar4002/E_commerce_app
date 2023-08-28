import 'package:flutter/material.dart';
import 'signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void switcToSignupScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), switcToSignupScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1F1E28),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splashIcon.png',
                width: 150,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'A whole store at your fingerpoint',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metropolis'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
