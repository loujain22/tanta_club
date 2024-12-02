import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class MemberProfileScreen extends StatelessWidget {
  const MemberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Member Profile", style: TTextTheme.textTheme.bodyLarge)),
    );
  }
}
