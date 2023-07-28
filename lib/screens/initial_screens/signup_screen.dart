import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff1E1F28),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffF6F6F6),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                      color: Color(0xffF6F6F6),
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
