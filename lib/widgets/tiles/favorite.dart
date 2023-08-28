import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/products.dart';

class FavoriteTile extends StatefulWidget {
  const FavoriteTile({super.key, required this.product, required this.index});

  final Product product;
  final int index;

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 25, right: 12, left: 12),
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
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage('${widget.product.image}'),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.61,
                margin: const EdgeInsets.only(left: 13, top: 6, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              // setState(() {
                              //   widget.product.isFavourited = false;
                              //   favouriteList.remove(widget.product);
                              // });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xffABB4BD),
                              size: 20,
                            ))
                      ],
                    ),
                    Text(
                      'Pullover',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 11),
                      child: Row(
                        children: [
                          Text(
                            'Color:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          const Text(
                            'Gray',
                            style: TextStyle(
                                color: Color(0xffF6F6F6),
                                fontFamily: 'Metropolis',
                                fontSize: 10),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            'Size:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          const Text(
                            'L',
                            style: TextStyle(
                                color: Color(0xffF6F6F6),
                                fontFamily: 'Metropolis',
                                fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '51\$',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RatingBar(
                                initialRating: 3,
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
                                '(3)',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 76,
          right: 12,
          child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xffEF3651),
              child: Image.asset(
                'assets/bagIcon.png',
                width: 12,
                height: 11,
              )),
        ),
      ],
    );
  }
}
