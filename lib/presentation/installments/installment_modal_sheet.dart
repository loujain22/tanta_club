import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/installments/add_button_widget.dart';
import 'package:tanta_club/presentation/installments/cancel_button_widget.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:tanta_club/providers/installment_provider.dart';

class InstallmentModalSheet extends StatefulWidget {
  final InstallmentProvider installmentProvider;

  const InstallmentModalSheet({super.key, required this.installmentProvider});

  @override
  State<InstallmentModalSheet> createState() => _InstallmentModalSheetState();
}

class _InstallmentModalSheetState extends State<InstallmentModalSheet> {
  final TextEditingController _installmentController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 35,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 230,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Form(
                      key: formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .installmentPlaceholder,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _installmentController,
                            keyboardType:
                                TextInputType.number, // Numeric keyboard
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseEnterInstallment;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.calendar),
                                labelText: AppLocalizations.of(context)!
                                    .installmentPlaceholder),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CancelButtonWidget(),
                              const SizedBox(width: 2),
                              AddButtonWidget(
                                  installmentCount: int.tryParse(
                                          _installmentController.text) ??
                                      0,
                                  installmentProvider:
                                      widget.installmentProvider),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Text(AppLocalizations.of(context)!.dInstallment,
              style: TTextTheme.textTheme.titleSmall)),
    );
  }
}
