import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/navigation_menu.dart';
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
            onPressed: () {
              final controller = Get.find<NavigationController>();
              controller.selectedIndex.value = 3;
            },
            icon: const Icon(Icons.menu)),
        Text(AppLocalizations.of(context)!.home,
            style: TTextTheme.textTheme.titleLarge),
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
