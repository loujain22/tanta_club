import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class SportsSection extends StatelessWidget {
  const SportsSection({
    super.key,
  });

  // -- Sports Circle Avatar
  Widget buildCircleAvatar(String img, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 178, 178, 178), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.0),
              //   backgroundImage: const AssetImage('assets/images/sportbg.png'),
              radius: 30,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white.withOpacity(0.0),
                backgroundImage: AssetImage(img),
              ),
            ),
          ),
        ),
        Text(title, style: TTextTheme.textTheme.labelLarge)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
          child: Text(
            S.of(context).sports,
            style: TTextTheme.textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildCircleAvatar(
                  'assets/images/football.png', S.of(context).football),
              buildCircleAvatar(
                  'assets/images/basketball.png', S.of(context).basketball),
              buildCircleAvatar(
                  'assets/images/crossfit.png', S.of(context).crossfit),
              buildCircleAvatar(
                  'assets/images/boxing.png', S.of(context).boxing),
              buildCircleAvatar(
                  'assets/images/running.png', S.of(context).running),
              buildCircleAvatar(
                  'assets/images/tennisball.png', S.of(context).tennisball),
            ],
          ),
        ),
      ],
    );
  }
}
