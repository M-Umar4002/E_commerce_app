import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/category.dart';
import '../../models/products.dart';
import '../../widgets/bottomsheets/sort_category.dart';
import '../../widgets/tiles/category.dart';
import 'package:http/http.dart' as http;

class SpecificCategoryScreen extends StatefulWidget {
  SpecificCategoryScreen(
      {super.key, required this.heading, this.id, required this.category});

  String heading;
  String? id;
  final Category category;

  @override
  State<SpecificCategoryScreen> createState() => _SpecificCategoryScreenState();
}

class _SpecificCategoryScreenState extends State<SpecificCategoryScreen> {
  String categoryName = 'Sort by';

  Products? products;

  Future<void> getAllItemsTile() async {
    http.Response response = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));

    setState(() {
      products = Products.fromJson(jsonDecode(response.body));
    });
  }

  Future<void> getCategoriesTileInfo(String id) async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/get/category/$id'));

    setState(() {
      products = Products.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getAllItemsTile();
    if (widget.id != null) {
      getCategoriesTileInfo(widget.id!);
    } else {
      getAllItemsTile();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1F28),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
            child: Row(
              children: [
                Text(
                  widget.heading,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                  child: _showTags(index),
                );
              },
              itemCount: widget.category.categories!.length,
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
            child: products == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xffEF3651),
                  ))
                : ListView.builder(
                    itemCount: products!.products!.length,
                    itemBuilder: (context, index) {
                      final productsList = products!.products![index];
                      return CategoryTile(
                        product: productsList,
                        heading: widget.heading,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  ElevatedButton _showTags(int index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffF6F6F6),
            minimumSize: const Size(90, 27),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28))),
        onPressed: () {
          setState(() {
            widget.heading = widget.category.categories![index].name!;
            getCategoriesTileInfo(widget.category.categories![index].id!);
          });
        },
        child: Text(widget.category.categories![index].name!,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: const Color(0xff2A2C36))));
  }
}
