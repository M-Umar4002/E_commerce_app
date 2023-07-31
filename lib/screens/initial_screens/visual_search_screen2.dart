import 'package:flutter/material.dart';
import '../../widgets/app_bottom_navbar.dart';

class VisualSearchScreen2 extends StatefulWidget {
  const VisualSearchScreen2({super.key});

  @override
  State<VisualSearchScreen2> createState() => _VisualSearchScreen2State();
}

class _VisualSearchScreen2State extends State<VisualSearchScreen2> {
  void switchToBottomNavbar() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppBottomNavBar(),
        ));
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      switchToBottomNavbar,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1F28),
        body: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 210,
                    height: 212,
                    color: Colors.amber,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 48, bottom: 3),
                child: Icon(
                  Icons.search,
                  size: 41,
                  color: Color(0xffEF3651),
                ),
              ),
              Text(
                'Finding similar results...',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
