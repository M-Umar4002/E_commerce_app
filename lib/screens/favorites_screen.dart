import 'package:flutter/material.dart';
import '../main.dart';
import '../models/products.dart';
import '../widgets/bottomsheets/sort_category.dart';
import '../widgets/tiles/favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required List<Product> favouriteList});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String categoryName = 'Price: lowest to high';
  List<String> tagList = ['T-shirts', 'Crop tops', 'Sleeveless', 'Shirts'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1F28),
        body: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            'Favorites',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: _showTags(tagList[index]),
                    );
                  },
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/doubleArrow.png',
                      width: 14,
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: const Color(0xff1E1F28),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(34))),
                            builder: (context) {
                              return const SortCategoryBottomSheet();
                            },
                          ).then((value) {
                            setState(() {
                              categoryName = value;
                            });
                          });
                        },
                        child: Text(
                          categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 10),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FavoriteTile(
                      product: favouriteList[index],
                      index: index,
                    );
                  },
                  itemCount: favouriteList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _showTags(String name) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffF6F6F6),
            minimumSize: const Size(90, 27),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28))),
        onPressed: () {},
        child: Text(name,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: const Color(0xff2A2C36))));
  }
}
