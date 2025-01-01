import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/app.dart';
import 'providers/events_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/news_provider.dart';
import 'providers/sports_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => SportsProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: const App(),
    ),
  );
}
