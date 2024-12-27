import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/Invoices/invoice_card.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () => Get.to(() => const PaymentMethodsScreen()),
              child: Text(S.of(context)!.payment,
                  style: TTextTheme.textTheme.titleLarge)),
        ),
        appBar: AppBar(
          title: Text(S.of(context)!.invoices),
          centerTitle: true,
          leading: IconButton.outlined(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.arrow_back)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: ListView(
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
                    S.of(context)!.invoiceSubtitle1,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(S.of(context)!.invoiceSubtitle2,
                      style: const TextStyle(fontSize: 18))
                ],
              ),
            ),
            //------------------------------------------------------------------------
            // -- Use ListView.builder
            InvoiceCard(
              remainingAmount: "1.550.00",
              invoiceId: "658",
              invoiceType: isArabic() ? "تجديد" : "Renewal",
            ),
            InvoiceCard(
              remainingAmount: "1.550.00",
              invoiceId: "658",
              invoiceType: isArabic() ? "تجديد" : "Renewal",
            ),
            InvoiceCard(
              remainingAmount: "1.550.00",
              invoiceId: "658",
              invoiceType: isArabic() ? "تجديد" : "Renewal",
            ),
            InvoiceCard(
              remainingAmount: "1.550.00",
              invoiceId: "658",
              invoiceType: isArabic() ? "تجديد" : "Renewal",
            ),
          ],
        ));
  }
}
