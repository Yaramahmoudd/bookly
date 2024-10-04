import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final IconData barIcon;
  const AppBarItem({super.key, required this.barIcon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Image.asset('assets/images/Logo.png',height: 40, width: 80,),
            IconButton(onPressed:() {
              
            }, icon:  Icon(barIcon, size: 25,))
        ],
      ),
    );
  }
}