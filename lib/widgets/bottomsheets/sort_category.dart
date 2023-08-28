import 'package:flutter/material.dart';

class SortCategoryBottomSheet extends StatefulWidget {
  const SortCategoryBottomSheet({super.key});

  @override
  State<SortCategoryBottomSheet> createState() =>
      _SortCategoryBottomSheetState();
}

class _SortCategoryBottomSheetState extends State<SortCategoryBottomSheet> {
  int? categorySelected;
  List categoryList = [
    'Popular',
    'Newest',
    'Customer review',
    'Price: lowest to high',
    'Price: highest to low'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort by',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 240,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _showCategories(index, categoryList[index]);
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _showCategories(int index, String categoryName) {
    return Container(
      width: double.infinity,
      color: categorySelected == index
          ? const Color(0xffEF3651)
          : Colors.transparent,
      child: TextButton(
        onPressed: () {
          setState(() {
            categorySelected = index;
            Navigator.pop(context, categoryList[index]);
          });
        },
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              categoryName,
              style: categorySelected == index
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: const Color(0xff2A2C36))
                  : Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
