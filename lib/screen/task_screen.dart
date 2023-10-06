import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/controller/asset_controller.dart';

import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/screen/camera_screen.dart';
import 'package:monitor_app/screen/detail_task_screen.dart';
import 'package:monitor_app/screen/form_checklist_screen.dart';
import 'package:monitor_app/screen/form_report_torque.dart';
import 'package:monitor_app/screen/form_report_verticality.dart';

class TaskScreen extends ConsumerStatefulWidget {
  static String routeName = 'task';
  final Task task;
  const TaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  // ignore: prefer_typing_uninitialized_variables
  // late AsyncValue<List<MasterAsset>> mAssetProv;

  List<String> header = [];
  List<dynamic> items = [];
  int current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    Future(() => ref.read(taskProvider.notifier).state = widget.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // mAssetProv = ref.watch(masterAssetProvider(Param(
    //   type: widget.task.type,
    //   fabricator: widget.task.site.fabricator,
    //   towerHeight: widget.task.site.towerHeight,
    // )));

    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.task.site.name),
        actions: [
          IconButton(
              onPressed: () async =>
                  // context.push('/task/camera', extra: await availableCameras()),
                  Navigator.of(context).pushNamed(CameraScreen.routeName,
                      arguments: await availableCameras()),
              icon: const Icon(Icons.camera)),
          IconButton(
              onPressed: () async {
                var task = ref.read(taskProvider.notifier).state;
                var taskId = task!.id;

                progressDialogue();
                for (var asset in task.assets!) {
                  // debugPrint('element : ${element.description} , ${element.url}');
                  var file = File(asset.url);
                  ref.read(assetUrlProvider.notifier).state =
                      file.path.split("/").last;
                  await ref
                      .read(assetControllerProvider.notifier)
                      .createAsset(taskId, asset);
                }
                Navigator.pop(context);
                debugPrint('done');
              },
              icon: const Icon(Icons.upload)),
        ],
      ),
      body: Column(
        children: [
          _getSiteInfo(),
          widget.task.type.toLowerCase() == "preventive"
              ? _buildChecklistButton()
              : _buildReportTorqueAndVerticality(),
          _buildAllRequirement(),
        ],
      ),
    );
  }

  Widget _buildReportTorqueAndVerticality() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFFEAEEF2),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FormReportTorque.routeName,
                    arguments: widget.task);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(40), // NEW
              ),
              child: const Text(
                'REPORT REGULAR MAINTENANCE : TORQUE',
                style: TextStyle(color: Colors.white),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FormReportVerticality.routeName,
                    arguments: widget.task);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size.fromHeight(40), // NEW
              ),
              child: const Text(
                'REPORT REGULAR MAINTENANCE : VERTICALITY',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  Widget _buildChecklistButton() => Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFEAEEF2),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(FormChecklistScreen.routeName,
                  arguments: widget.task.categoriesChecklist ?? []);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(40), // NEW
            ),
            child: const Text(
              'FORM CHECKLIST PREVENTIVE MAINTENANCE',
              style: TextStyle(color: Colors.white),
            )),
      );

  Widget _getSiteInfo() {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
            height: 150.0,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            if (index == 0) {
              return _getBody();
            } else {
              return _getBody2();
            }
          },
          itemCount: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 1].asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _getBody2() {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.task.site.name.toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(widget.task.site.id),
          Text(widget.task.site.address ?? ''),
          Text('${widget.task.site.region}, ${widget.task.site.province}'),
        ],
      ),
    );
  }

  Widget _getBody() {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.cell_tower, size: 48),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height : ${widget.task.site.towerHeight.toString()}'),
              Text('Type : ${widget.task.site.towerType}'),
              Text('Fabricator : ${widget.task.site.fabricator}'),
              Text('Tenant : ${widget.task.site.tenants}'),
              Text('Created Date : ${widget.task.createdDate}'),
            ],
          ),
        ],
      ),
    );
  }

  List<String> listSection = [];
  Widget _buildAllRequirement() {
    return Expanded(
        child: Container(
      color: const Color(0xFFEAEEF2),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 20),
      child: widget.task.assets != null ? _buildCategoriesAsset() : Container(),
      // child: mAssetProv.when(
      //   data: (data) {
      //     // print(data);
      //     bool isMultiTenant = false;
      //     List<String> tenants = widget.task.site.tenants!.split(',');
      //     if (tenants.length > 1) {
      //       isMultiTenant = true;
      //     }
      //     var sections = groupBy(data, (obj) => obj.section);
      //     List<dynamic> result = [];
      //     for (var element in sections.keys) {
      //       result.add(element);
      //       var categories = groupBy(sections[element]!, (obj) => obj.category);

      //       for (var cat in categories.keys) {
      //         if (isMultiTenant) {
      //           if (cat.toUpperCase() == "PANEL KWH" ||
      //               cat.toUpperCase() == "PANEL ACPDB" ||
      //               cat.toUpperCase() == "GROUNDING & LIGHTNING PROTECTION") {
      //             for (int i = 0; i < tenants.length; i++) {
      //               var newCat = '$cat (${tenants[i]})';
      //               result.add({newCat: categories[cat]!});
      //             }
      //           } else {
      //             result.add({cat: categories[cat]!});
      //           }
      //         } else {
      //           result.add({cat: categories[cat]!});
      //         }
      //       }
      //     }

      //     return ListView.separated(
      //         itemBuilder: (context, index) {
      //           if (result[index] is String) {
      //             return Text(result[index].toString().toUpperCase());
      //           } else {
      //             return GestureDetector(
      //               onTap: () {
      //                 // for (var element
      //                 //     in result[result.keys.elementAt(index)]!) {
      //                 //   print(element.description);
      //                 // }
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (context) => DetailTaskScreen(
      //                       title: result[index].keys.elementAt(0),
      //                       masterAsset: result[index]
      //                           [result[index].keys.elementAt(0)]!,
      //                     ),
      //                   ),
      //                 );
      //               },
      //               child: Container(
      //                 padding: const EdgeInsets.all(20),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 child: Text(result[index].keys.elementAt(0)),
      //               ),
      //             );
      //           }
      //         },
      //         separatorBuilder: (context, index) => const SizedBox(height: 10),
      //         itemCount: result.length);
      //   },
      //   error: (error, stackTrace) => Text(error.toString()),
      //   loading: () => const Center(child: CircularProgressIndicator()),
      // ),
    ));
  }

  Widget _buildCategoriesAsset() {
    bool isMultiTenant = false;
    List<String> tenants = widget.task.site.tenants != null
        ? widget.task.site.tenants!.split(';')
        : [];
    if (tenants.length > 1) {
      isMultiTenant = true;
    }
    var sections = groupBy(widget.task.assets!, (obj) => obj.section);
    List<dynamic> result = [];
    for (var element in sections.keys) {
      result.add(element);
      var categories = groupBy(sections[element]!, (obj) => obj.category);

      for (var cat in categories.keys) {
        debugPrint(cat);
        if (isMultiTenant) {
          if (cat.toUpperCase() == "PANEL KWH" ||
              cat.toUpperCase() == "PANEL ACPDB" ||
              cat.toUpperCase() == "GROUNDING & LIGHTNING PROTECTION") {
            for (int i = 0; i < tenants.length; i++) {
              var newCat = '$cat (${tenants[i]})';
              result.add({newCat: categories[cat]!});
            }
          } else {
            result.add({cat: categories[cat]!});
          }
        } else {
          result.add({cat: categories[cat]!});
        }
      }
    }

    return ListView.separated(
        itemBuilder: (context, index) {
          if (result[index] is String) {
            return Text(result[index].toString().toUpperCase());
          } else {
            return GestureDetector(
              onTap: () {
                // for (var element
                //     in result[result.keys.elementAt(index)]!) {
                //   print(element.description);
                // }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailTaskScreen(
                      title:
                          '${result[index].keys.elementAt(0)} (${(result[index][result[index].keys.elementAt(0)] as List).length})',
                      // masterAsset: result[index]
                      //     [result[index].keys.elementAt(0)]!,
                      assets: result[index][result[index].keys.elementAt(0)]!,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(result[index].keys.elementAt(0)),
              ),
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: result.length);
  }

  progressDialogue() {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      content: Consumer(builder: (context, ref, child) {
        var path = ref.watch(assetUrlProvider);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The loading indicator
            const CircularProgressIndicator(),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Uploading file : \n${path}'),
            )
          ],
        );
      }),
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
}
