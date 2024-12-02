import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Text("Payment", style: TTextTheme.textTheme.bodyLarge)),
    );
  }
}
