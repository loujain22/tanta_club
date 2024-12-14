import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 3.0, color: TColors.primary),
            ),
            onPressed: () {},
            icon: const Icon(Icons.menu)),
        Text(S.of(context).home, style: TTextTheme.textTheme.titleLarge),
        IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 3.0, color: TColors.primary),
            ),
            onPressed: () {},
            icon: const Icon(Iconsax.notification_bing)),
      ],
    );
  }
}
