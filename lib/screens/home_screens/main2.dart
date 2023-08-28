import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/products.dart';
import '../../widgets/cards/product.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  Products? saleProducts, newProducts;

  Future<void> getSaleProductsData() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));

    setState(() {
      saleProducts = Products.fromJson(jsonDecode(response.body));
    });
  }

  Future<void> getNewProductsData() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));

    setState(() {
      newProducts = Products.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getSaleProductsData();
    getNewProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1F1E28),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35),
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
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.21,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/842811/pexels-photo-842811.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-842811.jpg&fm=jpg'),
                        fit: BoxFit.fill,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.color))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Street clothes',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sale',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Super summer sale',
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ]),
                    Text(
                      'View all',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 252,
                  child: saleProducts == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffEF3651),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: saleProducts!.products!.length,
                          itemBuilder: (context, index) {
                            final productsList = saleProducts!.products![index];
                            return ProductCard(product: productsList);
                          })),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'You’ve never seen it before!',
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ]),
                    Text(
                      'View all',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 252,
                  child: newProducts == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffEF3651),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newProducts?.products!.length,
                          itemBuilder: (context, index) {
                            final productsList = newProducts!.products![index];
                            return ProductCard(product: productsList);
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
