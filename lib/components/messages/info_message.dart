import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class InfoMessage extends StatefulWidget {
  const InfoMessage({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  State<InfoMessage> createState() => _InfoMessageState();
}

class _InfoMessageState extends State<InfoMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent, // background color
          ),
          onPressed: () {
            var snackbar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: widget.title,
                  message: widget.message,
                  contentType: ContentType.help,
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text(isArabic() ? "إظهار رسالة المساعدة" : "Show Info Message",
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Almarai",
                  fontSize: 16))),
    );
  }
}
