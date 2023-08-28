import 'package:flutter/material.dart';
import '../../models/category.dart';
import 'specific_category.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Category? categories;

  Future<void> getCategoriesList() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/category/getAll'));

    setState(() {
      categories = categoryFromJson(response.body);
    });
  }

  @override
  void initState() {
    getCategoriesList();
    super.initState();
  }

  void switchToSpecificCategoryScreen(String heading, String? id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SpecificCategoryScreen(
                  heading: heading,
                  id: id,
                  category: categories!,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1F1E28),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40), child: _showAppbar()),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                children: [
                  _showAllItemsButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Choose category',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: categories == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffEF3651),
                      ),
                    )
                  : ListView.builder(
                      itemCount: categories!.categories!.length,
                      itemBuilder: (context, index) {
                        return _showCategoriesTile(index);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _showAppbar() {
    return AppBar(
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
        'Categories',
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
    );
  }

  ElevatedButton _showAllItemsButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEF3651),
          minimumSize: const Size.fromHeight(44),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {
        switchToSpecificCategoryScreen('All items', null);
      },
      child: Text(
        'VIEW ALL ITEMS',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget _showCategoriesTile(int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            switchToSpecificCategoryScreen(categories!.categories![index].name!,
                categories!.categories![index].id!);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 15, bottom: 15),
            child: Row(
              children: [
                Text(
                  categories!.categories![index].name!,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: const Color(0xffABB4BD).withOpacity(0.5),
          height: 0,
        ),
      ],
    );
  }
}
