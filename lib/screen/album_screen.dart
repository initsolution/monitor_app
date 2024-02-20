import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/screen/preview_screen.dart';
import 'package:path_provider/path_provider.dart';

class AlbumScreen extends ConsumerStatefulWidget {
  static String routeName = 'album';
  final bool isPickable;
  final File? lastImage;

  const AlbumScreen({
    super.key,
    this.isPickable = false,
    this.lastImage,
  });

  @override
  ConsumerState<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends ConsumerState<AlbumScreen> {
  List<File> allFileList = [];
  late int taskId;
  @override
  void initState() {
    taskId = ref.read(selectedTaskId);
    refreshAlreadyCapturedImages();
    super.initState();
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList =
        await Directory('${directory.path}/$taskId').list().toList();
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
                for (int i = 0; i < allFileList.length; i++)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () async {
                        // await Navigator.of(context)
                        //     .push(
                        //   MaterialPageRoute(
                        //     builder: (context) => PreviewScreen(
                        //       fileList: allFileList,
                        //       imageFile: imageFile,
                        //       isPickable: widget.isPickable,
                        //     ),
                        //   ),
                        // )
                        //     .then((value) async {
                        //   if (value != null) {
                        //     if (value) {
                        //       debugPrint('recentFileName : p1');
                        //       Navigator.of(context).pop();
                        //     }
                        //   } else {
                        //     refreshAlreadyCapturedImages();
                        //   }
                        // });
                        await Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => PreviewScreen(
                              imageFile: allFileList[i],
                              isPickable: widget.isPickable,
                            ),
                          ),
                        )
                            .then((value) {
                          if (value != null) {
                            Navigator.pop(context, value);
                          }
                        });
                        refreshAlreadyCapturedImages();
                      },
                      child: Image.file(
                        allFileList[i],
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
