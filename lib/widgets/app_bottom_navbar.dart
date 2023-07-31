import 'package:flutter/material.dart';
import '../screens/profile_screens/my_profile_screen.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int currentSelectedIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xff1E1F28),
        bottomNavigationBar: Container(
            height: 52,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: BottomNavigationBar(
                  currentIndex: currentSelectedIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color(0xff1E1F28),
                  selectedItemColor: const Color(0xffEF3651),
                  unselectedItemColor: const Color(0xffABB4BD),
                  selectedLabelStyle: const TextStyle(
                      color: Color(0xffEF3651),
                      fontFamily: 'Metropolis',
                      fontSize: 10),
                  unselectedLabelStyle: const TextStyle(
                      color: Color(0xffABB4BD),
                      fontFamily: 'Metropolis',
                      fontSize: 10),
                  onTap: (tappedIndex) {
                    setState(() {
                      pageController.animateToPage(tappedIndex,
                          duration: const Duration(microseconds: 900),
                          curve: Curves.bounceOut);
                    });
                  },
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Shop'),
                    BottomNavigationBarItem(
                        icon: currentSelectedIndex == 2
                            ? Image.asset(
                                'assets/shoppingBagIcon.png',
                                width: 22,
                                height: 21,
                                color: const Color(0xffEF3651),
                              )
                            : Image.asset(
                                'assets/shoppingBagIcon.png',
                                width: 22,
                                height: 21,
                                color: const Color(0xffABB4BD),
                              ),
                        label: 'Bag'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outline), label: 'Favorites'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.person_outlined), label: 'Profile')
                  ]),
            )),
        body: PageView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            const Center(
              child: Text('welcome'),
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
            ),
            Container(
              color: Colors.red,
            ),
            const MyProfileScreen()
          ],
          onPageChanged: (newPageIndex) {
            setState(() {
              currentSelectedIndex = newPageIndex;
            });
          },
        ),
      ),
    );
  }
}
