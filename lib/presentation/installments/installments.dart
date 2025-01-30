import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/installments/installment_card.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods.dart';
import 'package:tanta_club/providers/installment_provider.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  @override
  void initState() {
    super.initState();
    print("IN Installments Screen");
    Future.microtask(() =>
        Provider.of<InstallmentProvider>(context, listen: false)
            .fetchInstallments(context));
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          Provider.of<InstallmentProvider>(context, listen: false)
              .fetchInstallments(context);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const PaymentMethodsScreen()),
            child: Text(
              AppLocalizations.of(context)!.payment,
              style: TTextTheme.textTheme.titleLarge,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.installments),
          centerTitle: true,
          leading: IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
            ),
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: Consumer<InstallmentProvider>(
          builder: (ctx, installmentProvider, child) {
            if (installmentProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (installmentProvider.error != null) {
              return Center(child: Text(installmentProvider.error!));
            }

            final installments = installmentProvider.installments;
            if (installments.isEmpty) {
              return Center(
                child: Text(AppLocalizations.of(context)!.noInstallments),
              );
            }

            return ListView.builder(
              itemCount: installments.length,
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (ctx, i) => InstallmentCard(
                installment: installments[i],
                installmentProvider: installmentProvider,
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on AppLocalizations {
  String get noInstallments => "NO Installments";
}
