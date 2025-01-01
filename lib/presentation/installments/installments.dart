import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/installments/installment_card.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class InstallmentsScreen extends StatelessWidget {
  const InstallmentsScreen({super.key});

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
          title: Text(S.of(context)!.installments),
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
        body: ListView(children: [
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
                  S.of(context)!.installmentSubtitle1,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(S.of(context)!.installmentSubtitle2,
                    style: const TextStyle(fontSize: 18))
              ],
            ),
          ),

          //-------------------------------------------------
          // -- Use ListView.Builder
          InstallmentCard(
              itemName: isArabic()
                  ? "رسوم تأسيس العضوية الجديدة"
                  : "Establishment fees for new membership",
              dateOfFirstInstallment: "12/12/2024",
              remainingAmount: "16.500",
              installment: "1.500",
              total: "18.000"),
          InstallmentCard(
              itemName: isArabic()
                  ? "رسوم تأسيس العضوية الجديدة"
                  : "Establishment fees for new membership",
              dateOfFirstInstallment: "12/12/2024",
              remainingAmount: "16.500",
              installment: "1.500",
              total: "18.000"),
        ]));
  }
}
