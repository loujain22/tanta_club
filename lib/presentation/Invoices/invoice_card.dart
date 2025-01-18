import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/providers/invoice_provider.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class InvoiceCard extends StatefulWidget {
  final String remainingAmount;
  final String invoiceId;
  final String invoiceType;
  final bool isSelected;
  final Function(bool) onSelectionChanged;

  const InvoiceCard({
    super.key,
    required this.remainingAmount,
    required this.invoiceId,
    required this.invoiceType,
    required this.isSelected,
    required this.onSelectionChanged,
  });

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
                  AppLocalizations.of(context)!.remainingAmount,
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
                  AppLocalizations.of(context)!.invoiceNumber,
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
          ],
        ),
        subtitle: Text(widget.invoiceType),
        trailing: CheckBoxRounded(
          onTap: (bool? value) => widget.onSelectionChanged(value ?? false),
          isChecked: widget.isSelected,
          checkedColor: TColors.primary,
        ),
      )),
    );
  }
}
