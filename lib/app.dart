import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tanta_club/components/messages/messages.dart';
import 'package:tanta_club/generated/intl/messages_ar.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/Invoices/invoices.dart';
import 'package:tanta_club/presentation/change_password.dart';
import 'package:tanta_club/presentation/login.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods.dart';
import 'package:tanta_club/presentation/user-profile/user_profile.dart';
import 'package:tanta_club/utils/theme/custom_themes/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Locale _locale = const Locale('ar'); // Default locale

  // void setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Tanta',
      theme: TAppTheme.arabicAppTheme,
      //home: UserProfile(onLocaleChange: setLocale),
      home: const InvoicesScreen(),
    );
  }
}
