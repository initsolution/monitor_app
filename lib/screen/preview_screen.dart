// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:monitor_app/screen/captures_screen.dart';

class PreviewScreen extends StatelessWidget {
  static String routeName = 'preview';
  final bool isOnTap;
  final File imageFile;
  final List<File> fileList;
  final bool isPickable;

  const PreviewScreen({
    Key? key,
    required this.isOnTap,
    required this.imageFile,
    required this.fileList,
    required this.isPickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!isOnTap)
            IconButton(
              // onPressed: () => Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => const CapturesScreen(),
              //   ),
              // ),
              onPressed: () => Navigator.of(context).pushReplacementNamed(
                  CapturesScreen.routeName,
                  arguments: false),
              icon: const Icon(Icons.image_rounded),
            ),
          if (isPickable)
            IconButton(
              // onPressed: () => Navigator.popUntil(
              //     context, ModalRoute.withName('detail_task')),
              onPressed: () => Navigator.pop(context, true),
              icon: const Icon(Icons.check),
            ),
        ],
      ),
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.file(imageFile),
          ),
        ],
      ),
    );
  }
}
