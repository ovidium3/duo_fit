import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class RatingStars extends StatelessWidget {
  RatingStars({
    this.size = 18,
    required this.starsNumber,
    required this.filledStars,
    super.key,
  });

  int starsNumber, filledStars;
  double size;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(starsNumber, (orderIndex) {
        return Container(
          margin: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            size: size,
            color: orderIndex < filledStars
                ? ColorConstants.starFilled
                : ColorConstants.starEmpty.withOpacity(.45),
          ),
        );
      }),
    ]);
  }
}
