import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../main.dart';
import '../../models/products.dart';
import '../../screens/shop_screens/selected_product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void switchToSelectedProductScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedProductScreen(
            product: widget.product,
            heading: widget.product.category!.name!,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: switchToSelectedProductScreen,
      child: Container(
          width: 135,
          margin: const EdgeInsets.only(left: 13, top: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 186,
              child: Stack(
                children: [
                  Container(
                    width: 134,
                    height: 166,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage('${widget.product.image}'),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                      top: 7,
                      left: 5,
                      child: widget.product.tag == null
                          ? const SizedBox()
                          : Container(
                              width: 36,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: widget.product.tag!.name! == 'New'
                                      ? const Color(0xff1E1F28)
                                      : const Color(0xffFF3E3E),
                                  borderRadius: BorderRadius.circular(29)),
                              child: Center(
                                child: Text(
                                  widget.product.tag!.name!,
                                  style: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Metropolis',
                                      fontSize: 10),
                                ),
                              ),
                            )),
                  Positioned(
                    bottom: 6,
                    right: 0,
                    child: CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xff2A2C36),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.isFavourited =
                                  !widget.product.isFavourited;
                              if (widget.product.isFavourited) {
                                favouriteList.add(widget.product);
                              } else {
                                favouriteList.remove(widget.product);
                              }
                            });
                          },
                          icon: Image.asset(
                            'assets/heart.png',
                            width: 12,
                            height: 11,
                            color: widget.product.isFavourited
                                ? const Color(0xffEF3651)
                                : const Color(0xffABB4BD),
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Text(
                '${widget.product.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Text(
              '${widget.product.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Rs. ${widget.product.price}',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ])),
    );
  }
}
