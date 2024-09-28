import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Image.asset('assets/images/Logo.png',height: 40, width: 80,),
            IconButton(onPressed:() {
              
            }, icon: const Icon(Icons.search, size: 25,))
        ],
      ),
    );
  }
}