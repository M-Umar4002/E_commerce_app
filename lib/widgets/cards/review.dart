import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/reviews.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.reviews});

  final Reviews reviews;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  Color thumbColor = const Color(0xffABB4BD);
  bool isHelpful = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 14, right: 14, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
              color: Color(0xff2A2C36),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.reviews.user!.name}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(
                      initialRating: double.parse(widget.reviews.rating!),
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
                      DateFormat.yMMMd()
                          .format(widget.reviews.dateCreated!)
                          .toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
              Text(
                '${widget.reviews.review}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Helpful',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (isHelpful) {
                            thumbColor = const Color(0xffEF3651);
                          } else {
                            thumbColor = const Color(0xffABB4BD);
                          }
                          isHelpful = !isHelpful;
                        });
                      },
                      child: Icon(
                        Icons.thumb_up,
                        color: thumbColor,
                        size: 13,
                      ))
                ],
              )
            ],
          ),
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor:
              widget.reviews.user!.image == null ? Colors.grey[600] : null,
          child: widget.reviews.user!.image == null
              ? const Icon(
                  Icons.person,
                  color: Color(0xffF6F6F6),
                  size: 20,
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.reviews.user!.image!,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
