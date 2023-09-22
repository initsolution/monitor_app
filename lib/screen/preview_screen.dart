// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  static String routeName = 'preview';
  final File imageFile;
  // final int currentIndex;
  // final List<File> fileList;
  final bool isPickable;

  const PreviewScreen({
    Key? key,
    required this.imageFile,
    required this.isPickable,
  }) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  // late File currentImageFile;
  // late int currentIndex;
  // late List<File> allImages;
  // late int nextImage;
  // late File prevImage;

  // @override
  // void initState() {
  //   super.initState();
  // currentIndex = widget.currentIndex;
  // allImages = widget.fileList;
  // allImages.
  // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // if (widget.isPickable)
          //   IconButton(
          //     // onPressed: () => Navigator.of(context).pushReplacement(
          //     //   MaterialPageRoute(
          //     //     builder: (context) => const CapturesScreen(),
          //     //   ),
          //     // ),
          //     onPressed: () => Navigator.of(context).pushReplacementNamed(
          //         AlbumScreen.routeName,
          //         arguments: false),
          //     icon: const Icon(Icons.image_rounded),
          //   ),
          if (widget.isPickable)
            IconButton(
              // onPressed: () => Navigator.popUntil(
              //     context, ModalRoute.withName('detail_task')),
              onPressed: () async {
                // debugPrint('widget File : ${widget.imageFile.path}');
                var selectedImage = widget.imageFile.path;
                Navigator.pop(context, selectedImage);
              },
              icon: const Icon(Icons.check),
            ),
          IconButton(
            onPressed: () async {
              await widget.imageFile
                  .delete()
                  .then((value) => Navigator.of(context).pop());

              // int indexCurrent = allImages.indexWhere(
              //     (element) => element.path == currentImageFile.path);
              // debugPrint('indexCurrent $indexCurrent');
              // if (indexCurrent > 0) {
              //   if (indexCurrent < allImages.length - 1) {
              //     nextImage = indexCurrent + 1;
              //   } else if (indexCurrent == (allImages.length - 1)) {
              //     nextImage = allImages.length - 2;
              //   }
              //   allImages.remove(currentImageFile);
              //   currentImageFile.delete();

              //   currentImageFile = allImages.elementAt(nextImage);
              //   setState(() {});
              // } else if (indexCurrent == 0) {
              //   //delete and exit
              //   debugPrint('recentFileName : p0');
              //   currentImageFile.delete();
              //   Navigator.of(context).pop();
              // }

              // if (currentIndex == (allImages.length - 1)) {
              //   nextImage = currentIndex - 1;
              // } else if (currentIndex < allImages.length - 1) {
              //   nextImage = currentIndex + 1;
              // }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.file(widget.imageFile),
          ),
        ],
      ),
    );
  }
}
