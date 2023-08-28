import 'package:flutter/material.dart';

import '../../widgets/tiles/order_details.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  void state() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 12, right: 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                "My Bag",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const OrderDetailsTile(imagePath: 'assets/orderDetails1.png'),
              const OrderDetailsTile(imagePath: 'assets/orderDetails2.png'),
              const OrderDetailsTile(imagePath: 'assets/orderDetails3.png'),
            ]),
      ),
    );
  }
}
