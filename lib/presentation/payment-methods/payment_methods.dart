import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/payment-methods/payment-methods-card.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.paymentMethods),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              // -- Card
              PaymentMethodCard(
                title: isArabic()
                    ? "بطاقة الائتمان أو الفيزا"
                    : "Credit or Visa Card",
                img: "assets/icons/card.png",
              ),
              const SizedBox(height: 20),

              // -- Opay
              const PaymentMethodCard(
                title: "Opay",
                img: "assets/icons/opay.png",
              ),
              const SizedBox(height: 20),

              // -- Fawry
              PaymentMethodCard(
                title: isArabic() ? "فوري" : "Fawry",
                img: "assets/icons/fawry.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
