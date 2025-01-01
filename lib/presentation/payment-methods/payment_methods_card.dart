import 'package:flutter/material.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key, required this.title, required this.img});

  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TTextTheme.textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {},
          child: Card(
            child: ListTile(
              leading: Image.asset(img, height: 35, width: 35),
              title: Text(
                title,
                style: const TextStyle(color: TColors.secondary, fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
