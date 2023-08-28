import 'package:flutter/material.dart';
import 'visual_search1.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  void switchToVisualSearchScreen1() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VisualSearchScreen1(),
        ));
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
                      padding: const EdgeInsets.only(top: 12, bottom: 34),
                      child: Row(
                        children: [
                          Text('Forgot password',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    Text(
                      'Please, enter your email address. You will receive a link to create a new password via email.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 13,
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
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xff2A2C36))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xffFF2424))),
                          labelText: 'Email',
                          labelStyle: Theme.of(context).textTheme.labelMedium,
                          suffixIcon: const Icon(
                            Icons.close,
                            color: Color(0xffFF2424),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Not a valid email address. Should be your@email.com',
                      style: TextStyle(
                          color: Color(0xffFF2424),
                          fontFamily: 'Metropolis',
                          fontSize: 10),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF3651),
                          minimumSize: const Size.fromHeight(44),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: switchToVisualSearchScreen1,
                      child: Text(
                        'SEND',
                        style: Theme.of(context).textTheme.titleSmall,
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
