import 'package:flutter/material.dart';
import 'package:tanta_club/components/messages/failure_message.dart';
import 'package:tanta_club/components/messages/info_message.dart';
import 'package:tanta_club/components/messages/success_message.dart';
import 'package:tanta_club/components/messages/warning_message.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isArabic() ? 120 : 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FailureMessage(
              title: isArabic() ? "مشكلة!" : "On Snap!",
              message: isArabic()
                  ? "لقد فشلت في قراءة رسالة الفشل هذه. يرجى المحاولة مرة أخرى!"
                  : "You have failed to read this failure message. Please try again.",
            ),
            const SizedBox(height: 20),
            SuccessMessage(
              title: isArabic() ? "!تهنئة" : "Congratulation!",
              message: isArabic()
                  ? "هذا مثال لرسالة خطأ سيتم عرضها في نص شريط السناك بار!"
                  : "you have successfuly read this message. Please continue working!",
            ),
            const SizedBox(height: 20),
            WarningMessage(
              title: isArabic() ? "!تحذير" : "Warning!",
              message: isArabic()
                  ? "لديك تحذير لهذه الرسالة. يرجى قراءة هذا بعناية!"
                  : "You have a warning for this message. Please read this carefully!",
            ),
            const SizedBox(height: 20),
            InfoMessage(
              title: isArabic() ? "!معلومة" : "Info!",
              message: isArabic()
                  ? "تحتاج إلى استخدام هذه الحزمة في التطبيق للارتقاء بتجربة  السناك بار الخاصة بك."
                  : "you need to use this package in the app to uplift your snackbar experience.",
            ),
          ],
        ),
      ),
    );
  }
}
