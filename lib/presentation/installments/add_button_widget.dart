import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    super.key,
    required this.installmentCount,
  });

  final int installmentCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            AppLocalizations.of(context)!.add,
            style: const TextStyle(fontFamily: "Almarai"),
          ),
          onPressed: () {
            print("Add Btn Clicked  $installmentCount");

            Navigator.pop;
          }),
    );
  }
}
