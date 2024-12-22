import 'package:flutter/material.dart';
import 'package:tanta_club/data/news_data.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/news/new_card_widget.dart';
import 'package:tanta_club/style/colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Text(S.of(context)!.news),
          centerTitle: true,
          backgroundColor: TColors.primary,
          leading: IconButton.outlined(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.arrow_back)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: newsData.length,
            itemBuilder: (context, index) => NewsCardWidget(
                  news: newsData[index],
                )));
  }
}
