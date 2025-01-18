import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 50, left: isArabic() ? 0 : 20, right: isArabic() ? 20 : 0),
      child: Row(
        children: [
          IconButton.outlined(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
              ),
              onPressed: () =>
                  Get.find<NavigationController>().selectedIndex.value = 0,
              icon: const Icon(Icons.arrow_back)),
          SizedBox(width: isArabic() ? 65 : 80),
          Text(AppLocalizations.of(context)!.userProfile,
              style: TTextTheme.textTheme.titleLarge),
        ],
      ),
    );
  }
}
