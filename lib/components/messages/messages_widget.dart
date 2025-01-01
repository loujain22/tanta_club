import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  final Widget child;

  const MessagesWidget({super.key, required this.child});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();

  static _MessagesWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MessagesWidgetState>();
  }
}

class _MessagesWidgetState extends State<MessagesWidget> {
  Widget? _currentMessage;

  void updateMessage(Widget? message) {
    setState(() {
      _currentMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr, 
      children: [
        widget.child,
        if (_currentMessage != null)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: _currentMessage!,
            ),
          ),
      ],
    );
  }
}
