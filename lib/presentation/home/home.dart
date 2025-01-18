import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/presentation/home/events_sections.dart';
import 'package:tanta_club/presentation/home/home_page_header.dart';
import 'package:tanta_club/presentation/home/news_section.dart';
import 'package:tanta_club/presentation/home/sports_section.dart';
import 'package:tanta_club/providers/events_provider.dart';
import 'package:tanta_club/providers/news_provider.dart';
import 'package:tanta_club/providers/sports_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => SportsProvider()),
      ],
      child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
            child: HomePageHeader(),
          ),
          EventsSection(),
          SizedBox(height: 20),
          SportsSection(),
          SizedBox(height: 20),
          NewsSection(),
        ],
      ),
    );
  }
}
