import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              child: isArabic()
                  ? Image.asset("assets/images/rightAppBarBg.png")
                  : Image.asset("assets/images/leftAppBarBg.png")),

          // -- Page Header
          Padding(
            padding: EdgeInsets.only(
                top: 50, left: isArabic() ? 0 : 20, right: isArabic() ? 20 : 0),
            child: Row(
              children: [
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(width: isArabic() ? 65 : 80),
                Text(S.of(context).userProfile,
                    style: TTextTheme.textTheme.titleLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
