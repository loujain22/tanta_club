import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class FailureMessage extends StatefulWidget {
  const FailureMessage({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  State<FailureMessage> createState() => _FailureMessageState();
}

class _FailureMessageState extends State<FailureMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // background color
          ),
          onPressed: () {
            var snackbar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: widget.title,
                  message: widget.message,
                  contentType: ContentType.failure,
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text(
            isArabic() ? "إظهار رسالة الخطأ" : "Show Failure Message",
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Almarai",
                fontSize: 16),
          )),
    );
  }
}
