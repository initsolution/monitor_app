import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Center(
          child: TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK')),
        )
      ],
      title: const Text('Warning'),
      content: const Text('Please, make sure you have filled the fields!'),
    ),
  );
}
