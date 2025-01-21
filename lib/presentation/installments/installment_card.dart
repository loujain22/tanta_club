import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/installments/installment.dart';

class InstallmentCard extends StatelessWidget {
  final Installment installment;

  const InstallmentCard({
    Key? key,
    required this.installment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              installment.feesItemName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(
              context,
              AppLocalizations.of(context)!.dateOfFirstInstallment,
              installment.dateOfFirstInstallment,
            ),
            _buildInfoRow(
              context,
              AppLocalizations.of(context)!.remainingAmount,
              installment.remainingAmount.toString(),
            ),
            _buildInfoRow(
              context,
              AppLocalizations.of(context)!.installment,
              installment.amount.toString(),
            ),
            _buildInfoRow(
              context,
              AppLocalizations.of(context)!.total,
              installment.total.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
