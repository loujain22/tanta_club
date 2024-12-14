import 'package:flutter/material.dart';
import 'package:tanta_club/components/news_card.dart';
import 'package:tanta_club/data/news_data.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).news,
                style: TTextTheme.textTheme.headlineSmall,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).viewAll,
                    style: TTextTheme.textTheme.bodyMedium,
                  ),
                  const Icon(Icons.arrow_right)
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 240,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: newsData.length,
              itemBuilder: (context, index) => NewsCard(
                    news: newsData[index],
                    // indexitem: index,
                  )),
        ),
      ],
    );
  }
}
