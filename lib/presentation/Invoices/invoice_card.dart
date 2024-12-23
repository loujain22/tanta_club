import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/style/colors.dart';

class InvoiceCard extends StatefulWidget {
  const InvoiceCard({
    super.key,
    required this.remainingAmount,
    required this.invoiceId,
    required this.invoiceType,
  });

  final String remainingAmount;
  final String invoiceId;
  final String invoiceType;

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
          child: ListTile(
        leading: Image.asset("assets/icons/invoice-icon.png"),
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context)!.remainingAmount,
                  style: const TextStyle(color: TColors.secondary),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.remainingAmount,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  S.of(context)!.invoiceId,
                  style: const TextStyle(color: TColors.secondary),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.invoiceId,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  S.of(context)!.invoiceType,
                  style: const TextStyle(color: TColors.secondary),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.invoiceType,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            )
          ],
        ),
        trailing: CheckBoxRounded(
          onTap: (bool? value) {},
          checkedColor: TColors.primary,
        ),
      )),
    );
  }
}
