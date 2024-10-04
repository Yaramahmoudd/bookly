import 'package:bookly/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarItem(barIcon:Icons.shopping_cart),
      ],
    );
  }
}