import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/products.dart';
import 'package:http/http.dart' as http;
import '../../widgets/cards/product.dart';
import 'ratings_reviews.dart';

enum Sizes { XS, S, M, L, XL }

class SelectedProductScreen extends StatefulWidget {
  const SelectedProductScreen(
      {super.key, required this.product, required this.heading});

  final Product product;
  final String heading;

  @override
  State<SelectedProductScreen> createState() => _SelectedProductScreenState();
}

class _SelectedProductScreenState extends State<SelectedProductScreen> {
  Products? products;
  Sizes? sizes;
  List<String> colors = ['Black', 'Blue', 'Red'];
  String? selectedColor;

  Future<void> getProductsData() async {
    http.Response response = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));

    setState(() {
      products = Products.fromJson(jsonDecode(response.body));
    });
  }

  void switchToRatingsReviewsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RatingsAndReviewsScreen(product: widget.product),
        ));
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
              widget.heading,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Color(0xffF6F6F6),
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.48,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${widget.product.image}'),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _showSizeButton(),
                        _showColorButton(),
                        CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xff2A2C36),
                            child: Image.asset(
                              'assets/heart.png',
                              width: 12,
                              height: 11,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      '${widget.product.name}',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Rs. ${widget.product.price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: switchToRatingsReviewsScreen,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBar(
                            initialRating: double.parse(widget.product.rating!),
                            ignoreGestures: true,
                            itemSize: 16,
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Color(0xffFFBA49),
                              ),
                              half: const Icon(
                                Icons.star,
                                color: Color(0xffFFBA49),
                              ),
                              empty: const Icon(
                                Icons.star_border,
                                color: Colors.grey,
                              ),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                          Text(
                            '(${widget.product.reviews})',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '(${widget.product.description})',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    _showAddToCartButton()
                  ],
                ),
              ),
              Divider(
                color: const Color(0xffABB4BD).withOpacity(0.4),
                height: 0,
              ),
              _showTiles('Shipping info'),
              _showTiles('Support'),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'You can also like this',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '12 items',
                      style: Theme.of(context).textTheme.labelSmall,
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
                          })),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showSizeButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 124,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffABB4BD)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: const Color(0xff1F1E28),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xffABB4BD),
          ),
          hint: Text(
            'Size',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          items: Sizes.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ))
              .toList(),
          value: sizes,
          onChanged: (selectedSize) {
            setState(() {
              sizes = selectedSize;
            });
          },
        ),
      ),
    );
  }

  Widget _showColorButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 124,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffABB4BD)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: const Color(0xff1F1E28),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xffABB4BD),
          ),
          hint: Text(
            'Color',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          items: colors
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ))
              .toList(),
          value: selectedColor,
          onChanged: (color) {
            setState(() {
              selectedColor = color;
            });
          },
        ),
      ),
    );
  }

  ElevatedButton _showAddToCartButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEF3651),
          minimumSize: const Size.fromHeight(44),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {},
      child: Text(
        'ADD TO CART',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Column _showTiles(String name) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffABB4BD),
                size: 10,
              )
            ],
          ),
        ),
        Divider(
          color: const Color(0xffABB4BD).withOpacity(0.4),
          height: 0,
        ),
      ],
    );
  }
}
