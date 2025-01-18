import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/presentation/payment-methods/payment_methods_card.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/providers/invoice_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen>
    with WidgetsBindingObserver {
  String? _currentOrderId;
  bool _isVerifying = false;
  String? _orderId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _orderId != null) {
      _verifyPayment(context, _orderId!);
    }
  }

  Future<void> _verifyPayment(BuildContext context, String orderId) async {
    if (_isVerifying) return;

    setState(() {
      _isVerifying = true;
    });

    final provider = Provider.of<InvoiceProvider>(context, listen: false);
    final result = await provider.verifyPayment(context, orderId);

    if (!mounted) return;

    setState(() {
      _isVerifying = false;
    });

    if (result != null) {
      if (result.isPaid) {
        // Show success message with green background
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.paymentSuccessful(result.amount),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );

        // Refresh invoices after successful payment
        await provider.fetchInvoices(context);

        // Pop back to previous screen after a short delay
        if (!mounted) return;
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.paymentVerificationFailed,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.paymentVerificationError,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _handleCreditCardPayment(BuildContext context) async {
    final provider = Provider.of<InvoiceProvider>(context, listen: false);
    final result = await provider.paySelectedInvoices(
      context,
    );
    debugPrint(result.toString());
    if (result != null) {
      setState(() {
        _currentOrderId = result.orderId;
      });

      try {
        await launchUrlString(result.formUrl,
            mode: LaunchMode.externalApplication);
        // Start verification after launching payment URL
        if (_currentOrderId != null) {
          await _verifyPayment(context, _currentOrderId!);
        }
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.paymentLaunchError),
          ),
        );
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.selectInvoicesToPay),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) {
        if (hasFocus && _orderId != null) {
          _verifyPayment(context, _orderId!);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.paymentMethods),
          centerTitle: true,
          leading: IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 7, 7, 7),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                      onTap: () async {
                        final provider = Provider.of<InvoiceProvider>(context,
                            listen: false);
                        final result =
                            await provider.paySelectedInvoices(context);
                        debugPrint(result.toString());
                        if (result != null) {
                          try {
                            _orderId = result.orderId; // Store the order ID
                            await launchUrlString(
                              result.formUrl,
                              mode: LaunchMode.externalApplication,
                              webOnlyWindowName: '_self',
                            );
                          } catch (e) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .paymentLaunchError),
                              ),
                            );
                          }
                        }
                      },
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
            if (_isVerifying)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
