import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/Invoices/invoice_card.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:tanta_club/providers/invoice_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<InvoiceProvider>(context, listen: false)
        .fetchInvoices(context));
  }

  Future<void> _handlePayment(BuildContext context) async {
    final provider = Provider.of<InvoiceProvider>(context, listen: false);
    final result = await provider.paySelectedInvoices(context);
    if (result != null) {
      if (await canLaunch(result.formUrl)) {
        await launch(result.formUrl);
        // Refresh invoices when returning from payment
        await provider.fetchInvoices(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch payment page')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          Provider.of<InvoiceProvider>(context, listen: false).fetchInvoices(context);
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
              child: Text(AppLocalizations.of(context)!.payment,
                  style: TTextTheme.textTheme.titleLarge)),
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.invoices),
          centerTitle: true,
          leading: IconButton.outlined(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
              ),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: Consumer<InvoiceProvider>(
          builder: (context, invoiceProvider, child) {
            if (invoiceProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (invoiceProvider.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(invoiceProvider.error!),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => invoiceProvider.fetchInvoices(context),
                      child: Text(AppLocalizations.of(context)!.tryAgain),
                    ),
                  ],
                ),
              );
            }

            final invoices = invoiceProvider.invoices;

            if (invoices.isEmpty) {
              return Center(
                child: Text(AppLocalizations.of(context)!.noInvoices),
              );
            }

            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: isArabic() ? 0 : 40,
                      right: isArabic() ? 40 : 0,
                      bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.invoiceSubtitle1,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(AppLocalizations.of(context)!.invoiceSubtitle2,
                          style: const TextStyle(fontSize: 18))
                    ],
                  ),
                ),
                ...invoices
                    .map((invoice) => InvoiceCard(
                          remainingAmount:
                              invoice['remaining_amount']?.toString() ?? '0.00',
                          invoiceId: invoice['invoice_id']?.toString() ?? '',
                          invoiceType: invoice['invoice_type'] ??
                              (isArabic() ? "تجديد" : "Renewal"),
                          isSelected: invoiceProvider.isInvoiceSelected(
                              invoice['invoice_id']?.toString() ?? ''),
                          onSelectionChanged: (selected) =>
                              invoiceProvider.toggleInvoiceSelection(
                                  invoice['invoice_id']?.toString() ?? ''),
                        ))
                    .toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
