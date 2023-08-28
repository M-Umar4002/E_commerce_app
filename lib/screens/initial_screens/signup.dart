import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;

  void switchToLoginScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  void signup(String name, email, password) async {
    http.Response response = await http.post(
        Uri.parse('https://ecommerce.salmanbediya.com/users/register'),
        body: {'name': name, 'email': email, 'password': password});

    if (response.statusCode == 201) {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      switchToLoginScreen();
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
              automaticallyImplyLeading: false,
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: Column(children: [
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
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      cursorColor: const Color(0xffF5F5F5),
                      style: Theme.of(context).textTheme.titleSmall,
                      validator: (value) {
                        if (value!.isEmpty) {
                          'Name is required';
                        } else if (value.length < 3) {
                          'Enter correct name';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(
                          fillColor: const Color(0xff2A2C36),
                          filled: true,
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xff2A2C36))),
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
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: const Color(0xffF5F5F5),
                      style: Theme.of(context).textTheme.titleSmall,
                      validator: (value) {
                        if (value!.isEmpty) {
                          'Email is required';
                        } else if (value.contains(' ')) {
                          'Please give valid email address';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          'Password is required';
                        } else if (value.contains(' ')) {
                          'Password should not contain any blank space';
                        } else if (value.length < 8) {
                          'Pasword should contain at least 8 characters';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          onTap: switchToLoginScreen,
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
                    onPressed: () {
                      signup(nameController.text, emailController.text,
                          passwordController.text);
                    },
                    child: Text(
                      'SIGN UP',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 105,
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
              ),
            ),
          )),
    );
  }
}
