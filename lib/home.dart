import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tanta),
      ),
      body: Center(
          child: Text(
        S.of(context).tanta,
        style: const TextStyle(color: Colors.teal, fontSize: 42),
      )),
    );
  }
}
