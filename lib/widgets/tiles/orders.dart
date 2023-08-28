import 'package:flutter/material.dart';
import '../../screens/profile_screens/order_details.dart';

class OrdersTile extends StatefulWidget {
  const OrdersTile({super.key});

  @override
  State<OrdersTile> createState() => _OrdersTileState();
}

class _OrdersTileState extends State<OrdersTile> {
  void switchToOrderDetailsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderDetailsScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 12, left: 12),
      padding: const EdgeInsets.fromLTRB(16, 15, 15, 8),
      decoration: BoxDecoration(
          color: const Color(0xff2A2C36),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order No1947034',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                '05-12-2019',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: Row(
              children: [
                Text(
                  'Tracking number:',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'IW3475453455',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Quantity:',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(
                    width: 7,
                  ),
                  Text('3', style: Theme.of(context).textTheme.displaySmall)
                ],
              ),
              Row(
                children: [
                  Text('Total Amount:',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(
                    width: 7,
                  ),
                  Text('112\$', style: Theme.of(context).textTheme.displaySmall)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      minimumSize: const Size(88, 33),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xffF6F6F6)),
                          borderRadius: BorderRadius.circular(24))),
                  onPressed: switchToOrderDetailsScreen,
                  child: Text(
                    'Details',
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
              const Text(
                'Delivered',
                style: TextStyle(
                    color: Color(0xff55D85A),
                    fontFamily: 'Metropolis',
                    fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
