import 'dart:async';
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
  StreamController<List<String>> _streamController =
      StreamController<List<String>>();
  List<String> data = [];
  late int taskId;
  @override
  void initState() {
    taskId = ref.read(selectedTaskId);
    // refreshAlreadyCapturedImages();
    super.initState();
    _getImageData();
  }

  // refreshAlreadyCapturedImages() async {
  //   final directory = await getExternalStorageDirectory() ??
  //       await getApplicationDocumentsDirectory();
  //   List<FileSystemEntity> fileList =
  //       await Directory('${directory.path}/$taskId').list().toList();
  //   allFileList.clear();
  //   List<Map<int, dynamic>> fileNames = [];

  //   for (var file in fileList) {
  //     if (file.path.contains('.jpg')) {
  //       allFileList.add(File(file.path));

  //       String name = file.path.split('/').last.split('.').first;
  //       fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
  //     }
  //   }
  //   setState(() {});
  // }

  _getImageData() async {
    debugPrint("_getData");
    final directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList =
        await Directory('${directory.path}/$taskId').list().toList();
    fileList.sort((a, b) => b.path.compareTo(a.path));

    for (var file in fileList) {
      if (file.path.contains('.jpg')) {
        // allFileList.add(File(file.path));
        debugPrint('file : ${file.path}');
        data.add(file.path);
        _streamController.add(data);
      }
    }
    if (fileList.isEmpty) {
      _streamController.add(data);
    }
  }

  void _refresh() {
    data = [];
    _getImageData();
  }

  void deleteAllFile() async {
    final directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList =
        await Directory('${directory.path}/$taskId').list().toList();

    for (var file in fileList) {
      if (file.path.contains('.jpg')) {
        await file.delete();
      }
    }
    _refresh();
  }

  dialogDeleteConfirmation() {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        dismissDialog();
      },
    );
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        deleteAllFile();
        dismissDialog();
      },
    );
    AlertDialog alert = AlertDialog(
      elevation: 0,
      title: const Text("Delete Images"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        child: const Text("Do you want to Delete All Images?"),
      ),
      actions: [cancelButton, okButton],
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  dismissDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              dialogDeleteConfirmation();
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<List<String>>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              debugPrint('lewat');
              if (snapshot.hasData) {
                debugPrint("panjang : ${snapshot.data!.length}");
                if (snapshot.data!.length > 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: [
                          for (int i = 0; i < snapshot.data!.length; i++)
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
                                        imageFile: File(snapshot.data![i]),
                                        isPickable: widget.isPickable,
                                      ),
                                    ),
                                  )
                                      .then((value) {
                                    if (value != null) {
                                      Navigator.pop(context, value);
                                    }
                                    _refresh();
                                  });
                                  // refreshAlreadyCapturedImages();
                                },
                                child: Image.file(
                                  File(snapshot.data![i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("No data"),
                  );
                }
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            }),
      ),
    );
  }
}
