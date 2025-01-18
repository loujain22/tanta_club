import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tanta_club/components/messages/messages.dart';
import 'package:tanta_club/components/messages/messages_widget.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/presentation/login.dart';
import 'package:tanta_club/providers/auth_provider.dart';
import 'package:tanta_club/utils/theme/custom_themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: TAppTheme.arabicAppTheme,
      builder: (context, child) {
        return MessagesWidget(
          child: child ?? const SizedBox(),
        );
      },
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuth ? const NavigationMenu() : const LoginScreen();
        },
      ),
    );
  }
}
