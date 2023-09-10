import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monitor_app/screen/preview_screen.dart';
import 'package:path_provider/path_provider.dart';

class CapturesScreen extends StatefulWidget {
  static String routeName = 'capture';
  final bool isPickable;

  const CapturesScreen({
    super.key,
    this.isPickable = false,
  });

  @override
  State<CapturesScreen> createState() => _CapturesScreenState();
}

class _CapturesScreenState extends State<CapturesScreen> {
  List<File> allFileList = [];

  @override
  void initState() {
    refreshAlreadyCapturedImages();
    super.initState();
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();
    List<Map<int, dynamic>> fileNames = [];

    for (var file in fileList) {
      if (file.path.contains('.jpg')) {
        allFileList.add(File(file.path));

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                for (File imageFile in allFileList)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => PreviewScreen(
                              isOnTap: true,
                              fileList: allFileList,
                              imageFile: imageFile,
                              isPickable: widget.isPickable,
                            ),
                          ),
                        )
                            .then((value) async {
                          if (value) {
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
