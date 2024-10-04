
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/theming/font_weight.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/features/home/ui/widgets/book_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSallerListviewItem extends StatelessWidget {
  const BestSallerListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.bookDetailsScreen);
        },
        child: SizedBox(
                height: 110.h,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20),
                      child: Container(
                        height: 105.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage('assets/images/Book 1 High.png'))),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('Harry Potter and the Goblet of Fire',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font20WhiteRegular
                                    .copyWith(height: 1.2.h, wordSpacing: .2)),
                          ),
                          Text('J.K. Rowling', style: TextStyles.font14WhiteMedium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('19.99 €',
                                  style: TextStyles.font20WhiteRegular
                                      .copyWith(fontWeight: FontWeightHelper.bold)),
                              const BookRating(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}