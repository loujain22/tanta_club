import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/models/news.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/keys.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.newsDetails,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: "Almarai",
          ),
        ),
        leading: IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
            ),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontFamily: "Almarai",
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: TColors.secondary),
                    const SizedBox(width: 5),
                    Text(
                      "${AppLocalizations.of(context)!.date}: ${news.date}",
                      style: const TextStyle(
                        color: TColors.secondary,
                        fontSize: 14,
                        fontFamily: "Almarai",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Image.network(
            news.newImg,
            width: screenWidth,
            fit: BoxFit.cover,
            height: 350,
            headers: ApiKeys.getAuthImageHeaders(context),
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 350,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.error),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              news.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                height: 1.8,
                fontSize: 16,
                fontFamily: "Almarai",
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
