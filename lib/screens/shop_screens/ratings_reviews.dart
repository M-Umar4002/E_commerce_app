import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/products.dart';
import '../../models/reviews.dart';
import 'package:http/http.dart' as http;
import '../../widgets/bottomsheets/write_review.dart';
import '../../widgets/cards/review.dart';

class RatingsAndReviewsScreen extends StatefulWidget {
  const RatingsAndReviewsScreen({super.key, required this.product});

  final Product product;

  @override
  State<RatingsAndReviewsScreen> createState() =>
      _RatingsAndReviewsScreenState();
}

class _RatingsAndReviewsScreenState extends State<RatingsAndReviewsScreen> {
  RatingsReviews? reviews;

  Future<void> getProductsRatingsReviews() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/review/get/${widget.product.id}'));

    setState(() {
      reviews = RatingsReviews.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getProductsRatingsReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          ),
        ),
        floatingActionButton: _showWriteReviewButton(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Rating&Reviews',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 30),
              child: Column(
                children: [
                  Text(
                    '${widget.product.rating}',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 40),
                  ),
                  Text(
                    widget.product.reviews == 1
                        ? '${widget.product.reviews} rating'
                        : '${widget.product.reviews} ratings',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: reviews == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color(0xffEF3651),
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviews!.reviews!.length == 1
                              ? '${reviews!.reviews!.length} review'
                              : '${reviews!.reviews!.length} reviews',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Expanded(
                            child: reviews!.reviews!.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Center(
                                      child: Text(
                                        'There are not any reviews available on this product.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: reviews!.reviews!.length,
                                    itemBuilder: (context, index) {
                                      final reviewsList =
                                          reviews!.reviews![index];
                                      return ReviewCard(reviews: reviewsList);
                                    },
                                  )),
                      ],
                    ),
            )
          ]),
        ),
      ),
    );
  }

  ElevatedButton _showWriteReviewButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEF3651),
          fixedSize: const Size(118, 33),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color(0xff1E1F28),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(34))),
          builder: (context) {
            return WriteReviewBottomSheet(
              productId: '${widget.product.id}',
            );
          },
        );
      },
      child: Row(
        children: [
          Image.asset(
            'assets/pencil.png',
            width: 12,
            height: 12,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Write a review',
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
