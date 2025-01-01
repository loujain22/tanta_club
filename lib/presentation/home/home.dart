import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/presentation/home/events_sections.dart';
import 'package:tanta_club/presentation/home/home_page_header.dart';
import 'package:tanta_club/presentation/home/news_section.dart';
import 'package:tanta_club/presentation/home/sports_section.dart';
import 'package:tanta_club/providers/events_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch events when home screen initializes
    Future.microtask(() => 
      context.read<EventsProvider>().fetchEvents()
    );
  }

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

          // -- Sports Section
          EventsSection(),


          SizedBox(height: 20),
          SportsSection(),

          // -- Events Section

          SizedBox(height: 20),

          // -- News Scection
          NewsSection()
        ],
      ),
    );
  }
}
