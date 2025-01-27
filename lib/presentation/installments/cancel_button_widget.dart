import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          AppLocalizations.of(context)!.cancel,
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
