import 'package:flutter/material.dart';
import '../../widgets/tiles/order_details.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1F28),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
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
            centerTitle: true,
            title: Text(
              'Order Details',
              style: Theme.of(context).textTheme.bodyMedium,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 8),
                      child: Row(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        const Text(
                          'Delivered',
                          style: TextStyle(
                              color: Color(0xff55D85A),
                              fontFamily: 'Metropolis',
                              fontSize: 13),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            '3 items',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                    const OrderDetailsTile(
                        imagePath: 'assets/orderDetails1.png'),
                    const OrderDetailsTile(
                        imagePath: 'assets/orderDetails2.png'),
                    const OrderDetailsTile(
                        imagePath: 'assets/orderDetails3.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'Order information',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Address:',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        SizedBox(
                          width: 190,
                          child: Text(
                            '3 Newbridge Court ,Chino Hills, CA 91709, United States',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            'Payment method:',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset(
                              'assets/paymentMethodCoin.png',
                              width: 28,
                              height: 22,
                            ),
                          ),
                          Text(
                            '**** **** **** 3947',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery method:',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'FedEx, 3 days, 15\$',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Text(
                            'Discount:',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(
                            width: 58,
                          ),
                          Text(
                            '10%, Personal promo code',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Amount:',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: 31,
                        ),
                        Text(
                          '133\$',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _showReorderButton(),
                          _showLeaveFeedbackButton()
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _showReorderButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: const Size(144, 33),
            side: const BorderSide(color: Color(0xffF6F6F6)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        onPressed: () {},
        child: Text('Reorder', style: Theme.of(context).textTheme.bodySmall));
  }

  ElevatedButton _showLeaveFeedbackButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEF3651),
            fixedSize: const Size(144, 33),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        onPressed: () {},
        child: Text('Leave Feedback',
            style: Theme.of(context).textTheme.titleSmall));
  }
}
