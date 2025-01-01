import 'package:flutter/material.dart';
import 'package:tanta_club/components/messages/failure_message.dart';
import 'package:tanta_club/components/messages/success_message.dart';
import 'package:tanta_club/components/messages/warning_message.dart';
import 'package:tanta_club/components/messages/info_message.dart';
import 'package:tanta_club/components/messages/messages_widget.dart';

class MessagesUtil {
  static void showSuccessMessage(BuildContext context, String title, String message) {
    final messagesState = MessagesWidget.of(context);
    if (messagesState != null) {
      messagesState.updateMessage(
        SuccessMessage(
          title: title,
          message: message,
        ),
      );
    }
  }

  static void showErrorMessage(BuildContext context, String title, String message) {
    print('Showing error message: $title - $message');
    final messagesState = MessagesWidget.of(context);
    print('MessagesState found: ${messagesState != null}');
    if (messagesState != null) {
      messagesState.updateMessage(
        FailureMessage(
          title: title,
          message: message,
        ),
      );
      print('Message updated');
    } else {
      print('MessagesWidget not found in context');
    }
  }

  static void showWarningMessage(BuildContext context, String title, String message) {
    final messagesState = MessagesWidget.of(context);
    if (messagesState != null) {
      messagesState.updateMessage(
        WarningMessage(
          title: title,
          message: message,
        ),
      );
    }
  }

  static void showInfoMessage(BuildContext context, String title, String message) {
    final messagesState = MessagesWidget.of(context);
    if (messagesState != null) {
      messagesState.updateMessage(
        InfoMessage(
          title: title,
          message: message,
        ),
      );
    }
  }

  static void clearMessage(BuildContext context) {
    final messagesState = MessagesWidget.of(context);
    if (messagesState != null) {
      messagesState.updateMessage(null);
    }
  }
}
