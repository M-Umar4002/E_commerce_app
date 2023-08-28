import 'package:flutter/material.dart';

class OrderDetailsTile extends StatefulWidget {
  const OrderDetailsTile({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<OrderDetailsTile> createState() => _OrderDetailsTileState();
}

class _OrderDetailsTileState extends State<OrderDetailsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color(0xff2A2C36),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.imagePath,
            width: 94,
            height: 94,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pullover',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Mango',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        'Color:',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      const Text(
                        'Gray',
                        style: TextStyle(
                            color: Color(0xffF6F6F6),
                            fontFamily: 'Metropolis',
                            fontSize: 10),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Size:',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      const Text(
                        'L',
                        style: TextStyle(
                            color: Color(0xffF6F6F6),
                            fontFamily: 'Metropolis',
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Units:',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        const Text(
                          '1',
                          style: TextStyle(
                              color: Color(0xffF6F6F6),
                              fontFamily: 'Metropolis',
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      '51\$',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
