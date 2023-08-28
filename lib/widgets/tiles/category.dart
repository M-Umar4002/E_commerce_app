import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/products.dart';
import '../../screens/shop_screens/selected_product.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({super.key, required this.product, required this.heading});

  final Product product;
  final String heading;

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  String image = 'assets/orderDetails1.png';

  void switchToSelectedProductScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedProductScreen(
            product: widget.product,
            heading: widget.heading,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: switchToSelectedProductScreen,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20, right: 12, left: 12),
            decoration: BoxDecoration(
                color: const Color(0xff2A2C36),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(8)),
                      image: DecorationImage(
                          image: NetworkImage('${widget.product.image}'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product.name}',
                        style: Theme.of(context).textTheme.displaySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${widget.product.description}',
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RatingBar(
                              initialRating:
                                  double.parse(widget.product.rating!),
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
                      Row(
                        children: [
                          Text(
                            'Rs. ${widget.product.price}',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 76,
          right: 12,
          child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xff2A2C36),
              child: Image.asset(
                'assets/heart.png',
                width: 12,
                height: 11,
              )),
        ),
      ],
    );
  }
}
