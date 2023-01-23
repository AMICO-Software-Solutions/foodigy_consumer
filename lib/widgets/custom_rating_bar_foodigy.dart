// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodigy/utilities/const_color.dart';

// ignore: must_be_immutable
class CustomRatingFav extends StatefulWidget {
  String? productAverageRating;
  CustomRatingFav({super.key, this.productAverageRating});

  @override
  State<CustomRatingFav> createState() => _CustomRatingFavState();
}

class _CustomRatingFavState extends State<CustomRatingFav> {
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating:
          double.parse(widget.productAverageRating.toString()).roundToDouble(),
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: FoodigyColors.foodigyDisableRatingColor,
      ),
      itemCount: 5,
      itemSize: 20.0,
      unratedColor: FoodigyColors.foodigyDisableRatingColor.withAlpha(50),
      direction: Axis.horizontal,
    );
  }
}
