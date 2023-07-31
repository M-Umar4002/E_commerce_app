import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void switchToLoginScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff1E1F28),
          body: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(children: [
              const Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffF6F6F6),
                    size: 16,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 30),
                child: Row(
                  children: [
                    Text('Sign up',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
              SizedBox(
                height: 58,
                child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: const Color(0xffF5F5F5),
                  style: Theme.of(context).textTheme.titleSmall,
                  decoration: InputDecoration(
                      fillColor: const Color(0xff2A2C36),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple)),
                      labelText: 'Name',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      suffixIcon: const Icon(
                        Icons.check,
                        color: Color(0xff55D85A),
                      )),
                ),
              ),
              SizedBox(
                height: 58,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xffF5F5F5),
                  style: Theme.of(context).textTheme.titleSmall,
                  decoration: InputDecoration(
                      fillColor: const Color(0xff2A2C36),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple)),
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      suffixIcon: const Icon(
                        Icons.check,
                        color: Color(0xff55D85A),
                      )),
                ),
              ),
              SizedBox(
                height: 58,
                child: TextField(
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(0xffF5F5F5),
                  style: Theme.of(context).textTheme.titleSmall,
                  decoration: InputDecoration(
                      fillColor: const Color(0xff2A2C36),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple)),
                      labelText: 'Password',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      suffixIcon: const Icon(
                        Icons.check,
                        color: Color(0xff55D85A),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Color(0xffEF3651),
                            size: 15,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEF3651),
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: switchToLoginScreen,
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                height: 118,
              ),
              Text(
                'Or sign up with social account',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 58,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          onPressed: () {},
                          child: Image.asset(
                            'assets/googleIcon.png',
                            width: 21,
                            height: 21,
                          )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 75,
                      height: 58,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          onPressed: () {},
                          child: Image.asset(
                            'assets/facebookIcon.png',
                            width: 21,
                            height: 21,
                          )),
                    )
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
