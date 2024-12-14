import 'package:flutter/material.dart';
import 'package:tanta_club/presentation/home/events_sections.dart';
import 'package:tanta_club/presentation/home/home_page_header.dart';
import 'package:tanta_club/presentation/home/news_section.dart';
import 'package:tanta_club/presentation/home/sports_section.dart';

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
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
            child:
                // -- Header Section
                HomePageHeader(),
          ),

          // -- Events Section
          EventsSection(),

          SizedBox(height: 20),

          // -- Sports Section
          SportsSection(),

          SizedBox(height: 20),

          // -- News Scection
          NewsSection()
        ],
      ),
    );
  }
}
