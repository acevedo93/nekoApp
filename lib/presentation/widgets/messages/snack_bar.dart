import 'package:flutter/material.dart';

enum MessageType {
  success,
  warning,
  error
}

Map<MessageType, Color> colorsMap = {
  MessageType.error: Colors.redAccent,
  MessageType.success: Colors.greenAccent,
  MessageType.warning: Colors.yellowAccent
};

class SnackBarMessage extends StatelessWidget {
  final String message;
  final MessageType messageType;
  const SnackBarMessage({super.key, required this.message, required this.messageType});

  Color checkMessageType() {

    return colorsMap[messageType] ?? Colors.yellowAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: checkMessageType()),
      padding: const EdgeInsets.all(12),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}