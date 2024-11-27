import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Center(
                child: Image.asset("assets/logos/logo.png",
                    height: 230, width: 230)),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 90, right: isArabic() ? 25 : 0, left: isArabic() ? 0 : 25),
            child: Text(S.of(context).login,
                style: TTextTheme.arabicTextTheme.headlineMedium),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 5, right: isArabic() ? 25 : 0, left: isArabic() ? 0 : 25),
            child: Text(S.of(context).loginSubTitle,
                style: TTextTheme.arabicTextTheme.bodyLarge),
          )
        ],
      ),
    );
  }
}
