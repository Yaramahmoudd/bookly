import 'package:bookly/core/theming/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 17,
          color: Colors.amber,
        ),
        Text('4.8 ', style: TextStyles.font14WhiteMedium),
        Text('(2390)', style: TextStyles.font14WhiteRegular),
      ],
    );
  }
}
