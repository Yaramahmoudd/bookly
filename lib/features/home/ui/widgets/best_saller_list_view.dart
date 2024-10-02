import 'package:bookly/features/home/ui/widgets/best_saller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSallerListview extends StatelessWidget {
  const BestSallerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context , index){
      return const BestSallerListviewItem();
    });
  }
}