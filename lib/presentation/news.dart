import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("News", style: TTextTheme.textTheme.bodyLarge)),
    );
  }
}
