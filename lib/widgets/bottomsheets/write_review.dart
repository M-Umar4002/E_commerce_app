import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class WriteReviewBottomSheet extends StatefulWidget {
  const WriteReviewBottomSheet({super.key, required this.productId});

  final String productId;

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  TextEditingController reviewController = TextEditingController();
  double rating = 0;

  void addReview(String review) async {
    http.Response response = await http.post(
        Uri.parse('https://ecommerce.salmanbediya.com/products/review/add'),
        body: {
          'user (id)': review,
          'product (id)': widget.productId,
          'rating': rating,
          'review': review
        });

    if (response.statusCode == 201) {
      reviewController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            12, 15, 12, MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'What is you rate?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: RatingBar(
                itemPadding: const EdgeInsets.symmetric(horizontal: 6),
                initialRating: rating,
                // ignoreGestures: true,
                itemSize: 39,
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
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55, bottom: 16),
              child: Text(
                'Please share your opinion about the product',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              maxLines: 7,
              // minLines: 5,
              keyboardType: TextInputType.text,
              cursorColor: const Color(0xffF5F5F5),
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                fillColor: const Color(0xff2A2C36),
                filled: true,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xff2A2C36))),
                hintText: 'Your review',
                hintStyle: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            _showSendReviewButton(),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _showSendReviewButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEF3651),
          minimumSize: const Size.fromHeight(44),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {
        addReview(reviewController.text);
      },
      child: Text(
        'SEND REVIEW',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
