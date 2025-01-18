import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/news/new_card_widget.dart';
import 'package:tanta_club/providers/news_provider.dart';
import 'package:tanta_club/style/colors.dart';

import '../../navigation_menu.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsProvider>(context, listen: false).fetchNews(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Text(AppLocalizations.of(context)!.news),
          centerTitle: true,
          backgroundColor: TColors.primary,
          leading: IconButton.outlined(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
              ),
              onPressed: () =>
                  Get.find<NavigationController>().selectedIndex.value = 0,
              icon: const Icon(Icons.arrow_back)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: Consumer<NewsProvider>(
          builder: (context, newsProvider, child) {
            if (newsProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (newsProvider.error.isNotEmpty) {
              return Center(child: Text(newsProvider.error));
            }

            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: newsProvider.news.length,
                itemBuilder: (context, index) => NewsCardWidget(
                      news: newsProvider.news[index],
                    ));
          },
        ));
  }
}
