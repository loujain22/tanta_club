import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/components/news_card.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/providers/news_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewsProvider>().fetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        if (newsProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (newsProvider.error.isNotEmpty) {
          return Center(child: Text(newsProvider.error));
        }

        final news = newsProvider.news;

        if (news.isEmpty) {
          return const Center(child: Text('No news available'));
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
                    S.of(context)!.news,
                    style: TTextTheme.textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context)!.viewAll,
                        style: TTextTheme.textTheme.bodyMedium,
                      ),
                      const Icon(Icons.arrow_right)
                    ],
                  )
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 260,
                autoPlay: true,
              ),
              items: news.map((newsItem) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: NewsCard(news: newsItem),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
