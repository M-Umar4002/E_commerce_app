import 'package:flutter/material.dart';
import '../../widgets/tiles/orders.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int tagSelected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1F28),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffF6F6F6),
                        size: 16,
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Color(0xffF6F6F6),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'My Orders',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _showTags(0, 'Delivered'),
                        _showTags(1, 'Processing'),
                        _showTags(2, 'Cancelled')
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: PageView(
              controller: pageController,
              onPageChanged: (pageIndex) {
                setState(() {
                  tagSelected = pageIndex;
                });
              },
              children: [
                _showDeliveredTagList(),
                _showProcessingTagList(),
                _showCancelledTagList()
              ],
            ))
          ],
        ),
      ),
    );
  }

  ElevatedButton _showTags(int index, String tagName) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: tagSelected == index
                ? const Color(0xffF6F6F6)
                : const Color(0xff1E1F28),
            minimumSize: const Size(90, 27),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28))),
        onPressed: () {
          setState(() {
            tagSelected = index;
            pageController.jumpToPage(index);
          });
        },
        child: Text(
          tagName,
          style: TextStyle(
              color: tagSelected == index
                  ? const Color(0xff2A2C36)
                  : const Color(0xffF6F6F6),
              fontFamily: 'Metropolis',
              fontSize: 13),
        ));
  }

  ListView _showDeliveredTagList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const OrdersTile();
      },
      itemCount: 3,
    );
  }

  Widget _showProcessingTagList() {
    return Center(
      child: Text(
        'There is nothing in process',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _showCancelledTagList() {
    return Center(
      child: Text(
        'There is nothing cancelled',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
