import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/model/asset.dart';

import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/screen/camera_screen.dart';
import 'package:monitor_app/screen/detail_task_screen.dart';
import 'package:monitor_app/screen/form_checklist_screen.dart';
import 'package:monitor_app/screen/form_report_torque.dart';
import 'package:monitor_app/screen/form_report_verticality.dart';
import 'package:monitor_app/screen/temuan_screen.dart';

import '../controller/auth_controller.dart';
import '../mstate/auth_state.dart';

class TaskScreen extends ConsumerStatefulWidget {
  static String routeName = 'task';
  final Task task;
  // final int taskId;
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
  late Task task;
  String? token;

  @override
  void initState() {
    super.initState();
    if (widget.task.status == STATUS_TODO) {
      Future(() => ref
          .read(taskControllerProvider.notifier)
          .getTaskById(widget.task.id));
    } else {
      task = widget.task;
    }
    Future(() => ref.read(authControllerProvider.notifier).appStarted());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(
      authControllerProvider,
      (previous, next) {
        if (next is AuthAuthorized) {
          // _onLoginSuccess(context);
          token = next.userdata.token;
        } else if (next is AuthFailedWithError) {
          // _onLoginError(context, next.message);
        }
      },
    );
    ref.listen<TaskState>(
      taskControllerProvider,
      (previous, next) {
        if (next is TaskDataChangeSuccess) {
          dismissDialog();
          exitScreen();
        }
      },
    );
    var state = ref.watch(taskControllerProvider);
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.task.site.name),
          actions: [
            IconButton(
                onPressed: () async =>
                    // context.push('/task/camera', extra: await availableCameras()),
                    Navigator.of(context)
                        .pushNamed(CameraScreen.routeName,
                            arguments: await availableCameras())
                        .then((_) async => await ref
                            .read(taskControllerProvider.notifier)
                            .getTaskById(widget.task.id)),
                icon: const Icon(Icons.camera)),
            widget.task.status == STATUS_TODO
                ? IconButton(
                    onPressed: () async {
                      // var task = ref.read(taskProvider.notifier).state;
                      if (token != null) {
                        ref
                            .read(taskControllerProvider.notifier)
                            .uploadTaskByTaskId(widget.task.id, token);
                        progressDialogue();
                        // for (var asset in task.assets!) {
                        //   // debugPrint('element : ${element.description} , ${element.url}');
                        //   var file = File(asset.url);
                        //   ref.read(assetUrlProvider.notifier).state =
                        //       file.path.split("/").last;
                        //   await ref
                        //       .read(assetControllerProvider.notifier)
                        //       .uploadAsset(widget.taskId, asset, token);
                        // }
                        // dismissDialog();
                        // debugPrint('done');
                      }
                    },
                    icon: const Icon(Icons.upload))
                : const SizedBox(
                    width: 0,
                  ),
            IconButton(
              onPressed: () async {
                // progressDialogue();
                var assets = task.asset;
                int idx = 0;
                for (var asset in assets!) {
                  if (idx % 3 == 0) {
                    asset.url =
                        "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1699251430913.jpg";
                  } else if (idx % 3 == 1) {
                    asset.url =
                        "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1699251439012.jpg";
                  } else {
                    asset.url =
                        "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1699251430913.jpg";
                  }
                  idx++;
                  await ref
                      .read(taskControllerProvider.notifier)
                      .updateAssetLocalTask(asset);
                }
              },
              icon: const Icon(Icons.update),
            )
          ],
        ),
        body: widget.task.status == STATUS_TODO
            ? Consumer(builder: (context, ref, child) {
                debugPrint('reload task screen $state');
                if (state is TasksLoaded) {
                  task = state.tasks[0];
                  return Column(
                    children: [
                      _getSiteInfo(),
                      task.type.toLowerCase() == "preventive"
                          ? _buildChecklistButton()
                          : _buildReportTorqueAndVerticality(),
                      _buildAllRequirement(),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
            : Column(
                children: [
                  _getSiteInfo(),
                  task.type.toLowerCase() == "preventive"
                      ? _buildChecklistButton()
                      : _buildReportTorqueAndVerticality(),
                  _buildAllRequirement(),
                ],
              )
        // floatingActionButton: ElevatedButton.icon(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const TemuanScreen(
        //         section: '',
        //       ),
        //     ));
        //   },
        //   style: ElevatedButton.styleFrom(
        //     elevation: 2,
        //     backgroundColor: Colors.blue,
        //   ),
        //   icon: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ), //icon data for elevated button
        //   label: const Text(
        //     "Temuan",
        //     style: TextStyle(color: Colors.white),
        //   ), //label text
        // ),
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
                Navigator.of(context)
                    .pushNamed(FormReportTorque.routeName, arguments: task)
                    .then((_) async {
                  if (task.status == STATUS_TODO) {
                    await ref
                        .read(taskControllerProvider.notifier)
                        .getTaskById(widget.task.id);
                  }
                });
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
                Navigator.of(context)
                    .pushNamed(FormReportVerticality.routeName, arguments: task)
                    .then((_) async => await ref
                        .read(taskControllerProvider.notifier)
                        .getTaskById(widget.task.id));
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
              Navigator.of(context)
                  .pushNamed(FormChecklistScreen.routeName,
                      arguments: task.categoriesChecklist ?? [])
                  .then((_) async {
                if (widget.task.status == STATUS_TODO) {
                  await ref
                      .read(taskControllerProvider.notifier)
                      .getTaskById(widget.task.id);
                }
              });
              // Navigator.of(context)
              //     .pushNamed(FormChecklistScreen.routeName, arguments: task.id)
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
            task.site.name.toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(task.site.id),
          Text(task.site.address ?? ''),
          Text('${task.site.region}, ${task.site.province}'),
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
              Text('Height : ${task.site.towerHeight.toString()}'),
              Text('Type : ${task.site.towerType}'),
              Text('Fabricator : ${task.site.fabricator}'),
              Text('Tenant : ${task.site.tenants}'),
              Text('Created Date : ${task.createdDate}'),
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
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
          child: task.asset != null ? _buildCategoriesAsset() : Container()

          // Consumer(
          //   builder: (context, ref, child) {
          //     if (state is TaskLoaded) {
          //       return state.task.assets != null
          //           ? _buildCategoriesAsset()
          //           : Container();
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          ),
    );
  }

  Widget _buildCategoriesAsset() {
    bool isMultiTenant = false;
    List<String> tenants =
        task.site.tenants != null ? task.site.tenants!.split(';') : [];
    if (tenants.length > 1) {
      isMultiTenant = true;
    }
    var sections = groupBy(task.asset!, (obj) => obj.section);
    Map<String, Map<String, List<Asset>>> result = {};
    for (var key in sections.keys) {
      var categories = groupBy(sections[key]!, (obj) => obj.category);
      result.addAll({key: categories});
    }
    // debugPrint('result ${result.length}');
    return SingleChildScrollView(
      child: Column(
        children: result.entries.map((e) {
          return buildListView(e.key, e.value);
        }).toList(),
      ),
    );
    // return Column(children: result.entries.map((e) {return }).toList());

    // return ListView.separated(
    //     itemBuilder: (context, index) {
    //       if (result[index] is String) {
    //         return result[index].toString().toUpperCase() != 'SECTION'
    //             ? Text(result[index].toString().toUpperCase())
    //             : Container();
    //       } else {
    //         return GestureDetector(
    //           onTap: () async {
    //             // for (var element
    //             //     in result[result.keys.elementAt(index)]!) {
    //             //   print(element.description);
    //             // }
    //             await Navigator.of(context)
    //                 .push(
    //                   MaterialPageRoute(
    //                     builder: (context) => DetailTaskScreen(
    //                       title:
    //                           '${result[index].keys.elementAt(0)} (${(result[index][result[index].keys.elementAt(0)] as List).length})',
    //                       // masterAsset: result[index]
    //                       //     [result[index].keys.elementAt(0)]!,
    //                       assets: result[index]
    //                           [result[index].keys.elementAt(0)]!,
    //                     ),
    //                   ),
    //                 )
    //                 .then((_) async => await ref
    //                     .read(taskControllerProvider.notifier)
    //                     .getTaskById(widget.taskId));
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.all(20),
    //             decoration: BoxDecoration(
    //               color: result[index]
    //                           .keys
    //                           .elementAt(0)
    //                           .toString()
    //                           .toUpperCase() ==
    //                       'TEMUAN'
    //                   ? Colors.amber
    //                   : Colors.white,
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: Text(result[index].keys.elementAt(0)),
    //           ),
    //         );
    //       }
    //     },
    //     separatorBuilder: (context, index) => const SizedBox(height: 10),
    //     itemCount: result.length);
  }

  progressDialogue() {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      content: Consumer(builder: (context, ref, child) {
        var path = ref.watch(assetUrlProvider);
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Uploading file : \n$path'),
              )
            ],
          ),
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

  dismissDialog() {
    Navigator.pop(context);
  }

  exitScreen() {
    Navigator.pop(context);
  }

  Widget buildListView(String key, Map<String, List<Asset>> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        key.toUpperCase() != 'SECTION'
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  key.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // debugPrint(categories.keys.elementAt(index));
            // debugPrint(categories.values.elementAt(index).length.toString());
            return GestureDetector(
              onTap: () async {
                if (categories.keys.elementAt(index).toUpperCase() ==
                    "TEMUAN") {
                  return await Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => TemuanScreen(
                            task: task,
                            asset: categories.values.elementAt(index),
                            section: key,
                          ),
                        ),
                      )
                      .then((_) async => await ref
                          .read(taskControllerProvider.notifier)
                          .getTaskById(widget.task.id));
                } else {
                  return await Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => DetailTaskScreen(
                        statusTask: task.status,
                        title:
                            '${categories.keys.elementAt(index)} (${categories.values.elementAt(index).length})',
                        // masterAsset: result[index]
                        //     [result[index].keys.elementAt(0)]!,
                        assets: categories.values.elementAt(index),
                      ),
                    ),
                  )
                      .then((_) async {
                    if (widget.task.status == STATUS_TODO) {
                      await ref
                          .read(taskControllerProvider.notifier)
                          .getTaskById(widget.task.id);
                    }
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      categories.keys.elementAt(index).toUpperCase() == 'TEMUAN'
                          ? Colors.yellow[400]
                          : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(categories.keys.elementAt(index)),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: categories.length,
        ),
      ],
    );
  }
}
