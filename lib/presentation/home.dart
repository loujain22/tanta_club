import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/components/event_card.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: TColors.primary),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.menu)),
                Text(S.of(context).home,
                    style: TTextTheme.textTheme.titleLarge),
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: TColors.primary),
                    ),
                    onPressed: () {},
                    icon: const Icon(Iconsax.notification_bing)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Events",
                  style: TTextTheme.textTheme.headlineMedium,
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: TTextTheme.textTheme.bodyMedium,
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            child: CarouselSlider(
                items: [1, 2, 3, 4].map((i) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 1),
                      child: const EventsCard());
                }).toList(),
                options: CarouselOptions(
                  height: 260,
                  autoPlay: true,
                  //enlargeCenterPage: true,
                  //enlargeFactor: 0.3
                )),
          ),
        ],
      ),
    );
  }
}
