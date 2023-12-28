import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/helpers/format_helper.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/model/user_preferences.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/screen/camera_screen.dart';
import 'package:monitor_app/screen/detail_task_screen.dart';
import 'package:monitor_app/screen/form_checklist_screen.dart';
import 'package:monitor_app/screen/form_report_torque.dart';
import 'package:monitor_app/screen/form_report_verticality.dart';
import 'package:monitor_app/screen/temuan_screen.dart';

class TaskScreen extends ConsumerStatefulWidget {
  static String routeName = 'task';
  final Task task;
  // final int taskId;
  const TaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  List<String> header = [];
  List<dynamic> items = [];
  int current = 0;
  final CarouselController _controller = CarouselController();
  late Task task;
  late UserPreferences pref;
  bool infoVisible = true;

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
    Future(() async =>
        pref = await ref.read(preferenceManagerProvider).getUserData());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<TaskState>(
      taskControllerProvider,
      (previous, next) {
        if (next is TaskDataChangeSuccess) {
          dismissDialog();
          exitScreen();
        } else if (next is TaskDataNotComplete) {
          var title = next.title;
          var msg = next.message;
          var type = next.type;
          dismissDialog();
          ref.read(taskControllerProvider.notifier).getTaskById(widget.task.id);
          dialogErrorMsg(title, msg, type);
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
              icon: const Icon(Icons.camera_alt_rounded),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  infoVisible = !infoVisible;
                });
              },
              icon: const Icon(Icons.info_rounded),
            ),
            widget.task.status == STATUS_TODO
                ? IconButton(
                    onPressed: () async {
                      // var task = ref.read(taskProvider.notifier).state;
                      ref
                          .read(preferenceManagerProvider)
                          .getEsignData()
                          .then((value) {
                        if (value != '') {
                          ref
                              .read(taskControllerProvider.notifier)
                              .uploadTaskByTaskId(
                                  taskId: widget.task.id, token: pref.token);
                          progressDialogue();
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                Center(
                                  child: TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK')),
                                )
                              ],
                              title: const Text('Problem'),
                              content: const Text(
                                  'Please, make sure you have uploaded your E-sign (see account page)'),
                            ),
                          );
                        }
                      });
                    },
                    icon: const Icon(Icons.upload),
                  )
                : const SizedBox(
                    width: 0,
                  ),
            Visibility(
              visible: true,
              child: IconButton(
                onPressed: () async {
                  // progressDialogue();
                  var assets = task.asset;
                  int idx = 0;
                  for (var asset in assets!) {
                    if (idx % 3 == 0) {
                      asset.url =
                          "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1702518316507.jpg";
                    } else if (idx % 3 == 1) {
                      asset.url =
                          "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1702518316507.jpg";
                    } else {
                      asset.url =
                          "/storage/emulated/0/Android/data/com.bci.monitor_app/files/1702518316507.jpg";
                    }
                    idx++;
                    await ref
                        .read(taskControllerProvider.notifier)
                        .updateAssetLocalTask(asset);
                  }
                  await ref
                      .read(taskControllerProvider.notifier)
                      .getTaskById(widget.task.id);
                },
                icon: const Icon(Icons.update),
              ),
            )
          ],
        ),
        body: widget.task.status == STATUS_TODO
            ? Consumer(builder: (context, ref, child) {
                debugPrint('reload task screen $state');
                if (state is TaskLoaded) {
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
              ));
  }

  Widget _buildReportTorqueAndVerticality() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
      color: const Color(0xFFCFDEED),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'REPORT',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(FormReportTorque.routeName, arguments: task)
                .then((_) async {
              if (task.status == STATUS_TODO) {
                await ref
                    .read(taskControllerProvider.notifier)
                    .getTaskById(widget.task.id);
              }
            }),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/ic_report_torque.svg',
                      width: 40, height: 40),
                  const SizedBox(width: 20),
                  const Text('BOLT TIGHTENING TORQUE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(FormReportVerticality.routeName, arguments: task)
                .then((_) async => await ref
                    .read(taskControllerProvider.notifier)
                    .getTaskById(widget.task.id)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/ic_report_verticality.svg',
                      width: 40, height: 40),
                  const SizedBox(width: 20),
                  const Text('VERTICALITY',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(8),
    //   color: const Color(0xFFEAEEF2),
    //   child: Column(
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.of(context)
    //                 .pushNamed(FormReportTorque.routeName, arguments: task)
    //                 .then((_) async {
    //               if (task.status == STATUS_TODO) {
    //                 await ref
    //                     .read(taskControllerProvider.notifier)
    //                     .getTaskById(widget.task.id);
    //               }
    //             });
    //           },
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: Colors.blue,
    //             minimumSize: const Size.fromHeight(40), // NEW
    //           ),
    //           child: const Text(
    //             'REPORT REGULAR MAINTENANCE : TORQUE',
    //             style: TextStyle(color: Colors.white),
    //           )),
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.of(context)
    //                 .pushNamed(FormReportVerticality.routeName, arguments: task)
    //                 .then((_) async => await ref
    //                     .read(taskControllerProvider.notifier)
    //                     .getTaskById(widget.task.id));
    //           },
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: Colors.pink,
    //             minimumSize: const Size.fromHeight(40), // NEW
    //           ),
    //           child: const Text(
    //             'REPORT REGULAR MAINTENANCE : VERTICALITY',
    //             style: TextStyle(color: Colors.white),
    //           )),
    //     ],
    //   ),
    // );
  }

  Widget _buildChecklistButton() => Container(
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
        color: const Color(0xFFCFDEED),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'REPORT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(FormChecklistScreen.routeName,
                      arguments: task.categoriesChecklist ?? [])
                  .then((_) async {
                if (widget.task.status == STATUS_TODO) {
                  await ref
                      .read(taskControllerProvider.notifier)
                      .getTaskById(widget.task.id);
                }
              }),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/ic_report_checklist.svg',
                        width: 40, height: 40),
                    const SizedBox(width: 20),
                    const Text('CHECKLIST',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  // Container(
  //       padding: const EdgeInsets.all(8),
  //       color: const Color(0xFFEAEEF2),
  //       child: ElevatedButton(
  //           onPressed: () {
  //             Navigator.of(context)
  //                 .pushNamed(FormChecklistScreen.routeName,
  //                     arguments: task.categoriesChecklist ?? [])
  //                 .then((_) async {
  //               if (widget.task.status == STATUS_TODO) {
  //                 await ref
  //                     .read(taskControllerProvider.notifier)
  //                     .getTaskById(widget.task.id);
  //               }
  //             });
  //             // Navigator.of(context)
  //             //     .pushNamed(FormChecklistScreen.routeName, arguments: task.id)
  //           },
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.blue,
  //             minimumSize: const Size.fromHeight(40), // NEW
  //           ),
  //           child: const Text(
  //             'FORM CHECKLIST PREVENTIVE MAINTENANCE',
  //             style: TextStyle(color: Colors.white),
  //           )),
  //     );

  Widget _getSiteInfo() {
    return Visibility(
      visible: infoVisible,
      child: Container(
        color: Colors.blue,
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
                height: 140.0,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIndex) {
                if (index == 0) {
                  return _buildSiteInfoCard1();
                } else {
                  return _buildSiteInfoCard2();
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                            .withOpacity(current == entry.key ? 0.9 : 0.4)),
                    // color: (Theme.of(context).brightness == Brightness.dark
                    //         ? Colors.white
                    //         : Colors.black)
                    //     .withOpacity(current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSiteInfoCard2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.site.name.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(task.site.id, style: const TextStyle(color: Colors.white)),
          Text(task.site.address ?? '',
              style: const TextStyle(color: Colors.white)),
          Text('${task.site.region}, ${task.site.province}',
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildSiteInfoCard1() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Icon(Icons.cell_tower, size: 38),
          // const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height : ${task.site.towerHeight.toString()}',
                  style: const TextStyle(color: Colors.white)),
              Text('Type : ${task.site.towerType}',
                  style: const TextStyle(color: Colors.white)),
              Text('Fabricator : ${task.site.fabricator}',
                  style: const TextStyle(color: Colors.white)),
              Text('Tenant : ${task.site.tenants}',
                  style: const TextStyle(color: Colors.white)),
              Text(
                  'Created Date : ${formatTanggalIndonesia(task.created_at, 2)}',
                  style: const TextStyle(color: Colors.white)),
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
          child: task.asset != null ? _buildCategoriesAsset() : Container()),
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

  dialogErrorMsg(String title, String msg, String type) {
    Widget closeButton = TextButton(
      child: const Text("Close"),
      onPressed: () {
        dismissDialog();
      },
    );
    AlertDialog alert = AlertDialog(
      elevation: 0,
      title: Text(title),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: displayContent(msg, type),
      ),
      actions: [closeButton],
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

  Widget displayContent(msg, type) {
    var split = msg.split(";");
    if (type == "asset") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lengkapi Asset Gambar\n'),
          const Text(
            'Category :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${split[0]}'),
          const Text(
            'Description :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${split[1]}')
        ],
      );
    } else if (type == "torque") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lengkapi Isian Torque\n'),
          const Text(
            'Tower Segment :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${split[0]}'),
        ],
      );
    } else if (type == "horizontality") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lengkapi Isian Verticality\n'),
          const Text(
            'Horizontality :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${split[0]}'),
        ],
      );
    } else if (type == "theodolite") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lengkapi Isian Theodolite\n'),
          const Text(
            'Theodolite :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${split[0]}'),
        ],
      );
    }
    return Container();
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
              child: categories.keys.elementAt(index).toUpperCase() == 'TEMUAN'
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/ic_temuan.svg',
                              width: 40, height: 40),
                          const SizedBox(width: 20),
                          Text(
                            categories.keys.elementAt(index),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
