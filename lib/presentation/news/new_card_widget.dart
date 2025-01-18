import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/models/news.dart';
import 'package:tanta_club/models/news_model.dart';
import 'package:tanta_club/presentation/news/news_details.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/keys.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.news});

  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final newsDetails = News(
          id: 0,
          title: news.subject,
          date: news.dataTime,
          newImg: '${ApiKeys.baseUrl}${news.eventImage}',
          description: news.description,
        );
        Get.to(() => NewsDetailsScreen(news: newsDetails));
      },
      child: SizedBox(
        height: 315,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    '${ApiKeys.baseUrl}${news.eventImage}',
                    headers: ApiKeys.getAuthImageHeaders(context),
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(
                    left: isArabic() ? 0 : 15, right: isArabic() ? 15 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.subject,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 60, 60, 60),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(news.dataTime,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
