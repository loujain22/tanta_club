import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Text("Events", style: TTextTheme.textTheme.bodyLarge)),
    );
  }
}
