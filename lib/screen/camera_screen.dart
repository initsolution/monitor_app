// ignore_for_file: avoid_print

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/screen/album_screen.dart';
import 'package:monitor_app/screen/preview_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraExampleHome extends StatefulWidget {
  static String routeName = 'camera';
  final List<CameraDescription> cameras;

  const CameraExampleHome({super.key, required this.cameras});

  @override
  State<CameraExampleHome> createState() {
    return _CameraExampleHomeState();
  }
}

class _CameraExampleHomeState extends State<CameraExampleHome>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  File? _imageFile;
  List<File> allFileList = [];
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;
  bool _isCameraPermissionGranted = false;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;

  double _currentZoomLevel = 1.0;
  double _currentExposureOffset = 0.0;
  // ignore: unused_field
  FlashMode? _currentFlashMode;

  getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      debugPrint('Camera Permission: GRANTED');
      setState(() {
        _isCameraPermissionGranted = true;
      });
      // Set and initialize the new camera
      onNewCameraSelected(widget.cameras[0]);
      refreshAlreadyCapturedImages();
    } else {
      debugPrint('Camera Permission: DENIED');
    }
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();
    List<Map<int, dynamic>> fileNames = [];

    for (var file in fileList) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    }
    debugPrint('recentFileName : passed');
    if (fileNames.isNotEmpty) {
      final recentFile =
          fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
      String recentFileName = recentFile[1];
      debugPrint('recentFileName : $recentFileName');
      _imageFile = File('${directory.path}/$recentFileName');
      setState(() {});
    } else {
      if (_imageFile != null) {
        _imageFile = null;
        setState(() {});
      }
    }
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
    _currentExposureOffset = 0.0;
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController
            .getMinExposureOffset()
            .then((value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
        cameraController.setFocusMode(FocusMode.locked),
        cameraController.setFlashMode(FlashMode.off)
        // cameraController.setExposureMode(ExposureMode.auto)
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    getPermissionStatus();
    super.initState();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }
  // #enddocregion AppLifecycle

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _isCameraPermissionGranted
            ? _isCameraInitialized
                ? Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / controller!.value.aspectRatio,
                        child: Stack(
                          children: [
                            CameraPreview(
                              controller!,
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTapDown: (details) =>
                                      onViewFinderTap(details, constraints),
                                );
                              }),
                            ),
                            // Center(
                            //   child: Image.asset(
                            //     'assets/camera_aim.png',
                            //     color: Colors.greenAccent,
                            //     width: 150,
                            //     height: 150,
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16.0,
                                8.0,
                                16.0,
                                8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Align(
                                  //   alignment: Alignment.topRight,
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.black87,
                                  //       borderRadius:
                                  //           BorderRadius.circular(10.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.only(
                                  //         left: 8.0,
                                  //         right: 8.0,
                                  //       ),
                                  //       child: DropdownButton<ResolutionPreset>(
                                  //         dropdownColor: Colors.black87,
                                  //         underline: Container(),
                                  //         value: currentResolutionPreset,
                                  //         items: [
                                  //           for (ResolutionPreset preset
                                  //               in resolutionPresets)
                                  //             DropdownMenuItem(
                                  //               value: preset,
                                  //               child: Text(
                                  //                 preset
                                  //                     .toString()
                                  //                     .split('.')[1]
                                  //                     .toUpperCase(),
                                  //                 style: const TextStyle(
                                  //                     color: Colors.white),
                                  //               ),
                                  //             )
                                  //         ],
                                  //         onChanged: (value) {
                                  //           setState(() {
                                  //             currentResolutionPreset = value!;
                                  //             _isCameraInitialized = false;
                                  //           });
                                  //           onNewCameraSelected(
                                  //               controller!.description);
                                  //         },
                                  //         hint: const Text("Select item"),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${_currentExposureOffset.toStringAsFixed(1)}x',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: SizedBox(
                                        height: 30,
                                        child: Slider(
                                          value: _currentExposureOffset,
                                          min: _minAvailableExposureOffset,
                                          max: _maxAvailableExposureOffset,
                                          activeColor: Colors.white,
                                          inactiveColor: Colors.white30,
                                          onChanged: (value) async {
                                            setState(() {
                                              _currentExposureOffset = value;
                                            });
                                            await controller!
                                                .setExposureOffset(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Slider(
                                          value: _currentZoomLevel,
                                          min: _minAvailableZoom,
                                          max: _maxAvailableZoom,
                                          activeColor: Colors.white,
                                          inactiveColor: Colors.white30,
                                          onChanged: (value) async {
                                            setState(() {
                                              _currentZoomLevel = value;
                                            });
                                            await controller!
                                                .setZoomLevel(value);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${_currentZoomLevel.toStringAsFixed(1)}x',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isCameraInitialized = false;
                                          });
                                          onNewCameraSelected(widget.cameras[
                                              _isRearCameraSelected ? 1 : 0]);
                                          setState(() {
                                            _isRearCameraSelected =
                                                !_isRearCameraSelected;
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.black38,
                                              size: 60,
                                            ),
                                            Icon(
                                              _isRearCameraSelected
                                                  ? Icons.camera_front
                                                  : Icons.camera_rear,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          XFile? rawImage = await takePicture();
                                          File imageFile = File(rawImage!.path);

                                          int currentUnix = DateTime.now()
                                              .millisecondsSinceEpoch;

                                          // final directory =
                                          //     await getApplicationDocumentsDirectory();
                                          final directory =
                                              await getExternalStorageDirectory() ??
                                                  await getApplicationDocumentsDirectory();

                                          String fileFormat =
                                              imageFile.path.split('.').last;

                                          print(fileFormat);
                                          print(
                                              '${directory.path}/$currentUnix.$fileFormat');
                                          await imageFile.copy(
                                            '${directory.path}/$currentUnix.$fileFormat',
                                          );

                                          refreshAlreadyCapturedImages();
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.white38,
                                              size: 80,
                                            ),
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.white,
                                              size: 65,
                                            ),
                                            Container(),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _imageFile != null
                                            ? () async {
                                                // await Navigator.of(context)
                                                //     .push(
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         PreviewScreen(
                                                //       isOnTap: false,
                                                //       imageFile: _imageFile!,
                                                //       fileList: allFileList,
                                                //       isPickable: false,
                                                //     ),
                                                //   ),
                                                // )
                                                //     .then((value) {
                                                //   debugPrint(
                                                //       'recentFileName : p3');
                                                //   refreshAlreadyCapturedImages();
                                                // });
                                                await Navigator.of(context)
                                                    .pushNamed(
                                                  AlbumScreen.routeName,
                                                  arguments: false,
                                                );
                                                refreshAlreadyCapturedImages();
                                              }
                                            : null,
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            image: _imageFile != null
                                                ? DecorationImage(
                                                    image:
                                                        FileImage(_imageFile!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                          child: Container(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: SingleChildScrollView(
                      //     physics: const BouncingScrollPhysics(),
                      //     child: Column(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.fromLTRB(
                      //               16.0, 8.0, 16.0, 8.0),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   setState(() {
                      //                     _currentFlashMode = FlashMode.off;
                      //                   });
                      //                   await controller!.setFlashMode(
                      //                     FlashMode.off,
                      //                   );
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.flash_off,
                      //                   color:
                      //                       _currentFlashMode == FlashMode.off
                      //                           ? Colors.amber
                      //                           : Colors.white,
                      //                 ),
                      //               ),
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   setState(() {
                      //                     _currentFlashMode = FlashMode.auto;
                      //                   });
                      //                   await controller!.setFlashMode(
                      //                     FlashMode.auto,
                      //                   );
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.flash_auto,
                      //                   color:
                      //                       _currentFlashMode == FlashMode.auto
                      //                           ? Colors.amber
                      //                           : Colors.white,
                      //                 ),
                      //               ),
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   setState(() {
                      //                     _currentFlashMode = FlashMode.always;
                      //                   });
                      //                   await controller!.setFlashMode(
                      //                     FlashMode.always,
                      //                   );
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.flash_on,
                      //                   color: _currentFlashMode ==
                      //                           FlashMode.always
                      //                       ? Colors.amber
                      //                       : Colors.white,
                      //                 ),
                      //               ),
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   setState(() {
                      //                     _currentFlashMode = FlashMode.torch;
                      //                   });
                      //                   await controller!.setFlashMode(
                      //                     FlashMode.torch,
                      //                   );
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.highlight,
                      //                   color:
                      //                       _currentFlashMode == FlashMode.torch
                      //                           ? Colors.amber
                      //                           : Colors.white,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : const Center(
                    child: Text(
                      'LOADING',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(),
                  const Text(
                    'Permission denied',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      getPermissionStatus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Give permission',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
