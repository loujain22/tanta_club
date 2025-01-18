import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/app.dart';
import 'providers/events_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/news_provider.dart';
import 'providers/sports_provider.dart';
import 'providers/user_provider.dart';
import 'providers/invoice_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authProvider = AuthProvider();
  await authProvider.tryAutoLogin(); // Try auto-login when app starts

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => SportsProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => InvoiceProvider()),
      ],
      child: const App(),
    ),
  );
}
