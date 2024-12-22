import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class SuccessMessage extends StatefulWidget {
  const SuccessMessage({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  State<SuccessMessage> createState() => _SuccessMessageState();
}

class _SuccessMessageState extends State<SuccessMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // background color
          ),
          onPressed: () {
            var snackbar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: widget.title,
                  message: widget.message,
                  contentType: ContentType.success,
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text(
            isArabic() ? "إظهار رسالة التهنئة" : "Show Success Message",
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Almarai",
                fontSize: 16),
          )),
    );
  }
}
