import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class WarningMessage extends StatefulWidget {
  const WarningMessage({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  State<WarningMessage> createState() => _WarningMessageState();
}

class _WarningMessageState extends State<WarningMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // background color
          ),
          onPressed: () {
            var snackbar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: widget.title,
                  message: widget.message,
                  contentType: ContentType.warning,
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text(
            isArabic() ? "إظهار رسالة التحذير" : "Show Warning Message",
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Almarai",
                fontSize: 16),
          )),
    );
  }
}
