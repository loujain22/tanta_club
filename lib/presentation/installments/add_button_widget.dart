import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/providers/installment_provider.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget(
      {super.key,
      required this.installmentCount,
      required this.installmentProvider});

  final int installmentCount;
  final InstallmentProvider installmentProvider;

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
            installmentProvider.test_log();
            print("Add Btn Clicked  $installmentCount");

            Navigator.pop;
          }),
    );
  }
}
