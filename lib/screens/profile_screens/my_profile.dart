import 'package:flutter/material.dart';
import 'my_orders.dart';
import 'settings.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  void _switchToMyOrdersScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyOrdersScreen(),
        ));
  }

  void _switchToSettingsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1F28),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xffF6F6F6),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 14),
                    child: Row(
                      children: [
                        Text(
                          'My profile',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Matilda Brown',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'matildabrown@mail.com',
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _showProfileTiles(
                'My orders', 'Already have 12 orders', _switchToMyOrdersScreen),
            Divider(
              color: const Color(0xffABB4BD).withOpacity(0.4),
              height: 0,
            ),
            _showProfileTiles('Shipping addresses', '3 addresses', () {}),
            Divider(
              color: const Color(0xffABB4BD).withOpacity(0.4),
              height: 0,
            ),
            _showProfileTiles('Payment methods', 'Visa **34', () {}),
            Divider(
              color: const Color(0xffABB4BD).withOpacity(0.4),
              height: 0,
            ),
            _showProfileTiles(
                'Promocodes', 'You have special promocodes', () {}),
            Divider(
              color: const Color(0xffABB4BD).withOpacity(0.4),
              height: 0,
            ),
            _showProfileTiles('My reviews', 'Reviews for 4 items', () {}),
            Divider(
              color: const Color(0xffABB4BD).withOpacity(0.4),
              height: 0,
            ),
            _showProfileTiles(
                'Settings', 'Notifications, password', _switchToSettingsScreen),
          ],
        ),
      ),
    );
  }

  InkWell _showProfileTiles(String title, subtitle, onTapFunction) {
    return InkWell(
      onTap: onTapFunction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffABB4BD),
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
