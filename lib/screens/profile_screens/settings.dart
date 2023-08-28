import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../widgets/bottomsheets/change_password.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController passwordController = TextEditingController();
  bool isFirstButtonSwitched = true;
  bool isSecondButtonSwitched = false;
  bool isThirdButtonSwitched = false;

  @override
  void initState() {
    passwordController = TextEditingController(text: '****************');
    super.initState();
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
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xffF6F6F6),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 13),
                    child: Row(
                      children: [
                        Text(
                          'Personal Information',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
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
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                const BorderSide(color: Color(0xff2A2C36))),
                        labelText: 'Full name',
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: 58,
                    child: TextField(
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
                        labelText: 'Date of Birth',
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                        hintText: '12/12/1989',
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: const Color(0xff1E1F28),
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(34))),
                              builder: (context) {
                                return const ChangePasswordBottomSheet();
                              },
                            );
                          },
                          child: Text(
                            'Change',
                            style: Theme.of(context).textTheme.labelMedium,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 58,
                    child: TextField(
                      controller: passwordController,
                      enabled: false,
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          'Notifications',
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sales',
                          style: Theme.of(context).textTheme.bodySmall),
                      _showSwitchButtons(isFirstButtonSwitched,
                          (isFirstSwitched) {
                        setState(() {
                          isFirstButtonSwitched = isFirstSwitched;
                        });
                      })
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New arrivals',
                            style: Theme.of(context).textTheme.bodySmall),
                        _showSwitchButtons(isSecondButtonSwitched,
                            (isSecondSwitched) {
                          setState(() {
                            isSecondButtonSwitched = isSecondSwitched;
                          });
                        })
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery status changes',
                          style: Theme.of(context).textTheme.bodySmall),
                      _showSwitchButtons(isThirdButtonSwitched,
                          (isThirdSwitched) {
                        setState(() {
                          isThirdButtonSwitched = isThirdSwitched;
                        });
                      })
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  FlutterSwitch _showSwitchButtons(
      bool buttonSwitched, Function onToggleFunction) {
    return FlutterSwitch(
      height: 20,
      width: 33,
      padding: 0,
      toggleSize: 18,
      borderRadius: 15,
      value: buttonSwitched,
      activeColor: Colors.grey.shade800,
      activeToggleColor: const Color(0xff55D85A),
      inactiveColor: Colors.grey.shade800,
      inactiveToggleColor: const Color(0xffABB4BD),
      onToggle: (value) {
        onToggleFunction(value);
      },
    );
  }
}
