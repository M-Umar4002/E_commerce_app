import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/products.dart';
import 'package:http/http.dart' as http;
import '../../widgets/cards/product.dart';
import 'main2.dart';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1> {
  Products? products;

  void switchToMainScreen2() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen2(),
        ));
  }

  Future<void> getProductsData() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));

    setState(() {
      products = Products.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1F1E28),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.58,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.cuded.com/wp-content/uploads/2017/08/hair-styles-for-men-31.jpg'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          'Fashion sale',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffEF3651),
                              fixedSize: const Size(144, 33),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          onPressed: switchToMainScreen2,
                          child: Text('Check',
                              style: Theme.of(context).textTheme.titleSmall))
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
                  child: products == null
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Color(0xffEF3651),
                        ))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products!.products!.length,
                          itemBuilder: (context, index) {
                            final productsList = products!.products![index];
                            return ProductCard(product: productsList);
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
