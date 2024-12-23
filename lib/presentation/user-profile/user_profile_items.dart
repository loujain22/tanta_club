import 'package:flutter/material.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem(
      {super.key, required this.itemIcon, required this.title});

  final String title;
  final String itemIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(itemIcon, height: 35, width: 35),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
