import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/components/news_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/providers/news_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  void initState() {
    super.initState();
    // Fetch news when widget initializes
    Future.microtask(() =>
        Provider.of<NewsProvider>(context, listen: false).fetchNews(context));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        if (newsProvider.isLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ));
        }

        if (newsProvider.error.isNotEmpty) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(newsProvider.error),
          ));
        }

        if (newsProvider.news.isEmpty) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(AppLocalizations.of(context)!.noNewsAvailable),
          ));
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.news,
                    style: TTextTheme.textTheme.headlineSmall,
                  ),
                  InkWell(
                    onTap: () {
                      final controller = Get.find<NavigationController>();
                      controller.selectedIndex.value = 2; // Index 2 is for News
                    },
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.viewAll,
                          style: TTextTheme.textTheme.bodyMedium,
                        ),
                        const Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CarouselSlider(
              items: newsProvider.news.map((news) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: NewsCard(
                    news: news,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 240,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        );
      },
    );
  }
}
