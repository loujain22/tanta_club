import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/components/event_card.dart';
import 'package:tanta_club/components/news_card.dart';
import 'package:tanta_club/data/news_data.dart';
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
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
            child:
                // -- Header Section
                Row(
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

/////////////////////////////////////////////////////
          // -- Events Header SectionS
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
          // -- Carousel Events Section
          CarouselSlider(
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
          const SizedBox(height: 15),

//////////////////////////////////////////////////////
          // -- Sports Header Section
          Padding(
            padding: EdgeInsets.only(
                right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
            child: Text(
              "Sports",
              style: TTextTheme.textTheme.headlineMedium,
            ),
          ),
          // -- Sports Section
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCircleAvatar('assets/images/football.png', 'Football'),
                buildCircleAvatar('assets/images/basketball.png', 'Basketball'),
                buildCircleAvatar('assets/images/crossfit.png', 'Crossfit'),
                buildCircleAvatar('assets/images/boxing.png', 'Boxing'),
                buildCircleAvatar('assets/images/running.png', 'Running'),
                buildCircleAvatar('assets/images/tennisball.png', 'Tennisball'),
              ],
            ),
          ),

////////////////////////////////////////////////////////
          // -- News Header Scection
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(
                right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News",
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
          // -- News sectiob
          // Expanded(
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: newsData.length,
          //       itemBuilder: (context, index) => NewsCard(
          //             news: newsData[index],
          //             // indexitem: index,
          //           )),
          // ),
        ],
      ),
    );
  }
}
