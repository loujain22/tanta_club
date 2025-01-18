import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/providers/sports_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/keys.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:tanta_club/models/sport_model.dart';
import 'package:tanta_club/presentation/sports/sports_details.dart';

class SportsSection extends StatefulWidget {
  const SportsSection({super.key});

  @override
  State<SportsSection> createState() => _SportsSectionState();
}

class _SportsSectionState extends State<SportsSection> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<SportsProvider>(context, listen: false)
        .fetchSports(context));
  }

  Widget buildCircleAvatar(SportModel sport) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SportsDetails(sport: sport),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 178, 178, 178),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.0),
                radius: 30,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.0),
                  backgroundImage: NetworkImage(
                    '${ApiKeys.baseUrl}${sport.icon}',
                    headers: ApiKeys.getAuthImageHeaders(context),
                  ),
                ),
              ),
            ),
          ),
          Text(sport.sportName, style: TTextTheme.textTheme.labelLarge)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SportsProvider>(
      builder: (context, sportsProvider, child) {
        if (sportsProvider.isLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (sportsProvider.error.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(sportsProvider.error),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
              child: Text(
                AppLocalizations.of(context)!.sports,
                style: TTextTheme.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: sportsProvider.sports
                    .map((sport) => buildCircleAvatar(sport))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
