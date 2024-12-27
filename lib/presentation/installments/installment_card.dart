import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/installments/installment_modal_sheet.dart';
import 'package:tanta_club/style/colors.dart';

class InstallmentCard extends StatelessWidget {
  const InstallmentCard(
      {super.key,
      required this.itemName,
      required this.dateOfFirstInstallment,
      required this.remainingAmount,
      required this.installment,
      required this.total});

  final String itemName,
      dateOfFirstInstallment,
      remainingAmount,
      installment,
      total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
          color: TColors.cardBackground,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckBoxRounded(
                  onTap: (bool? value) {},
                  checkedColor: TColors.primary,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context)!.itemName,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      itemName,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context)!.dateOfFirstInstallment,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      dateOfFirstInstallment,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context)!.remainingAmount,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      remainingAmount,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context)!.installment,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      installment,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context)!.total,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      total,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10),
                    InstallmentModalSheet(),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
