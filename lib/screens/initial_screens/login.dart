import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'forgot_password.dart';
import 'visual_search1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordObscure = true;

  void switchToForgotPasswordScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ));
  }

  void switchToVisualSearchScreen1() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const VisualSearchScreen1(),
        ));
  }

  void login(String email, password) async {
    http.Response response = await http.put(
        Uri.parse('https://ecommerce.salmanbediya.com/users/login'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      emailController.clear();
      passwordController.clear();
      switchToVisualSearchScreen1();
      email = emailController.text;
    } else {
      emailController.clear();
      passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff1E1F28),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              backgroundColor: const Color(0xff1E1F28),
              leadingWidth: 45,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffF6F6F6),
                  size: 16,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 30),
                      child: Row(
                        children: [
                          Text('Login',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 58,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: const Color(0xffF5F5F5),
                        style: Theme.of(context).textTheme.titleSmall,
                        decoration: InputDecoration(
                            fillColor: const Color(0xff2A2C36),
                            filled: true,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Color(0xff2A2C36))),
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
                      child: TextFormField(
                        obscureText: isPasswordObscure,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color(0xffF5F5F5),
                        style: Theme.of(context).textTheme.titleSmall,
                        decoration: InputDecoration(
                            fillColor: const Color(0xff2A2C36),
                            filled: true,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Color(0xff2A2C36))),
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordObscure = !isPasswordObscure;
                                  });
                                },
                                icon: Icon(
                                  isPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xffABB4BD),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: switchToForgotPasswordScreen,
                            child: Row(
                              children: [
                                Text(
                                  'Forgot your password?',
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
                      onPressed: () {
                        login(emailController.text, passwordController.text);
                      },
                      child: Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 163,
                    ),
                    Text(
                      'Or login with social account',
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
                                        borderRadius:
                                            BorderRadius.circular(24))),
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
                                        borderRadius:
                                            BorderRadius.circular(24))),
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
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
