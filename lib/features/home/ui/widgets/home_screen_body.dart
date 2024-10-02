import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/core/widgets/app_bar.dart';
import 'package:bookly/features/home/ui/widgets/best_saller_list_view.dart';
import 'package:bookly/features/home/ui/widgets/books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarItem(),
              const BooksListView(),
              Padding(
                padding: const EdgeInsets.only(
                    right: 16.0, left: 16, top: 40.0, bottom: 10),
                child: Text(
                  'Best Seller',
                  style: TextStyles.font18WhiteSemiBold,
                ),
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestSallerListview(),
        )
      ],
    ));
  }
}
