import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 224.h,
        width: 120.w,
        decoration:  BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image:AssetImage('assets/images/Book 1 High.png') )
        ),
      ),
    );
  }
}