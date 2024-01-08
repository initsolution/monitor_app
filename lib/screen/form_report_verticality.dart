// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/helpers/utils.dart';
import 'package:monitor_app/model/report_reg_verticality.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/model/value_verticality.dart';

class FormReportVerticality extends ConsumerStatefulWidget {
  static String routeName = 'report_verticality';

  final Task task;
  const FormReportVerticality({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  ConsumerState<FormReportVerticality> createState() =>
      _FormReportVerticalityState();
}

class _FormReportVerticalityState extends ConsumerState<FormReportVerticality> {
  TextEditingController horCon1 = TextEditingController();
  TextEditingController horCon2 = TextEditingController();
  TextEditingController horCon3 = TextEditingController();
  TextEditingController horCon4 = TextEditingController();

  TextEditingController alatUkurCon = TextEditingController();
  TextEditingController toleransiKetegakanCon = TextEditingController();

  List<TextEditingController> valueT1Con = [];
  List<TextEditingController> valueT2Con = [];
  // ignore: non_constant_identifier_names
  final int MAX_SECTION_NUMBER = 10;

  List<String> theodoliteItems = [
    'A-B',
    'B-C',
    'C-D',
    'D-A',
  ];

  late String theodoliteValue;
  late String theodoliteValue2;
  List<String> miringKe = [];
  List<String> miringKe2 = [];
  late List<String> miringKeItem;
  late List<String> miringKeItem2;
  int toleransiKetegakanMenara = 0;

  List<int> selectedIndexTheodolite = [];
  bool isEnable = true;

  @override
  void initState() {
    super.initState();
    debugPrint('reports ${widget.task.status}');
    debugPrint('reports ${widget.task.reportRegVerticality.toString()}');
    if (widget.task.reportRegVerticality == null) {
      theodoliteValue = theodoliteItems[0];
      theodoliteValue2 = theodoliteItems[0];
      debugPrint('theoDolite : $theodoliteValue');
      debugPrint('theoDolite : $theodoliteValue2');
      miringKeItem = theodoliteItems[0].split('-');
      miringKeItem2 = theodoliteItems[0].split('-');
      for (int i = 0; i < MAX_SECTION_NUMBER; i++) {
        miringKe.add(miringKeItem[0]);
        miringKe2.add(miringKeItem2[0]);
        valueT1Con.add(TextEditingController());
        valueT2Con.add(TextEditingController());
      }
    } else {
      if (widget.task.status.toLowerCase() == STATUS_TODO) {
        isEnable = true;
      } else {
        isEnable = false;
      }
      widget.task.reportRegVerticality!.valueVerticality!
        .sort((a, b) {
          if (a.theodoliteIndex != b.theodoliteIndex) {
            return a.theodoliteIndex.compareTo(b.theodoliteIndex);
          } else {
            return a.section.compareTo(b.section);
          }
        });
      theodoliteValue = widget.task.reportRegVerticality!.theodolite1;
      theodoliteValue2 = widget.task.reportRegVerticality!.theodolite2;
      setSelectedIndexTheodolite(theodoliteValue);
      setSelectedIndexTheodolite(theodoliteValue2);
      miringKeItem = theodoliteValue.split('-');
      miringKeItem2 = theodoliteValue2.split('-');
      for (int i = 0; i < MAX_SECTION_NUMBER; i++) {
        miringKe.add(
            widget.task.reportRegVerticality!.valueVerticality![i].miringKe);
        miringKe2.add(widget.task.reportRegVerticality!
            .valueVerticality![MAX_SECTION_NUMBER + i].miringKe);
        valueT1Con.add(TextEditingController());
        valueT2Con.add(TextEditingController());

        valueT1Con[i].text = widget
            .task.reportRegVerticality!.valueVerticality![i].value
            .toString();
        valueT2Con[i].text = widget.task.reportRegVerticality!
            .valueVerticality![MAX_SECTION_NUMBER + i].value
            .toString();
      }
      horCon1.text =
          widget.task.reportRegVerticality!.horizontalityAb.toString();
      horCon2.text =
          widget.task.reportRegVerticality!.horizontalityBc.toString();
      horCon3.text =
          widget.task.reportRegVerticality!.horizontalityCd.toString();
      horCon4.text =
          widget.task.reportRegVerticality!.horizontalityDa.toString();
      debugPrint(
          'toleransi ketegakan menara : ${widget.task.reportRegVerticality!.toleransiKetegakan}');
      toleransiKetegakanMenara =
          widget.task.reportRegVerticality!.toleransiKetegakan;
      toleransiKetegakanCon.text = toleransiKetegakanMenara.toString();
      alatUkurCon.text = widget.task.reportRegVerticality!.alatUkur;
    }
  }

  void setSelectedIndexTheodolite(String theodoliteValue) {
    switch (theodoliteValue) {
      case 'A-B':
        selectedIndexTheodolite.add(1);
        break;
      case 'B-C':
        selectedIndexTheodolite.add(2);
        break;
      case 'C-D':
        selectedIndexTheodolite.add(3);
        break;
      case 'D-A':
        selectedIndexTheodolite.add(4);
        break;
      default:
    }
  }

  @override
  void dispose() {
    horCon1.dispose();
    horCon2.dispose();
    horCon3.dispose();
    horCon4.dispose();
    alatUkurCon.dispose();
    toleransiKetegakanCon.dispose();
    valueT1Con.clear();
    valueT2Con.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.task.status.toLowerCase() == STATUS_TODO) {
          await showAlertDialog(context);
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Rep. Verticality'),
          actions: [
            if (widget.task.status.toLowerCase() == STATUS_TODO)
              IconButton(
                  onPressed: () async {
                    if (theodoliteValue == theodoliteValue2) {
                      warningDialog();
                      return;
                    }

                    if (widget.task.reportRegVerticality != null) {
                      List<ValueVerticality> valueVerticalities = [];
                      //theo 1
                      for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                        ValueVerticality valueVerticality = ValueVerticality(
                            id: widget.task.reportRegVerticality!
                                .valueVerticality![i].id,
                            theodoliteIndex: 1,
                            section: i + 1,
                            miringKe: miringKe[i],
                            value: valueT1Con[i].text != ''
                                ? int.parse(valueT1Con[i].text)
                                : 0);
                        valueVerticalities.add(valueVerticality);
                      }
                      //theo 2
                      for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                        ValueVerticality valueVerticality = ValueVerticality(
                            id: widget.task.reportRegVerticality!
                                .valueVerticality![MAX_SECTION_NUMBER + i].id,
                            theodoliteIndex: 2,
                            section: i + 1,
                            miringKe: miringKe2[i],
                            value: valueT2Con[i].text != ''
                                ? int.parse(valueT2Con[i].text)
                                : 0);
                        valueVerticalities.add(valueVerticality);
                      }
                      ReportRegVerticality report = ReportRegVerticality(
                          id: widget.task.reportRegVerticality!.id,
                          horizontalityAb:
                              horCon1.text != '' ? int.parse(horCon1.text) : 0,
                          horizontalityBc:
                              horCon2.text != '' ? int.parse(horCon2.text) : 0,
                          horizontalityCd:
                              horCon3.text != '' ? int.parse(horCon3.text) : 0,
                          horizontalityDa:
                              horCon4.text != '' ? int.parse(horCon4.text) : 0,
                          theodolite1: theodoliteValue,
                          theodolite2: theodoliteValue2,
                          alatUkur: alatUkurCon.text,
                          toleransiKetegakan: toleransiKetegakanMenara,
                          valueVerticality: valueVerticalities);
                      ref
                          .read(taskControllerProvider.notifier)
                          .saveReportVerticality(widget.task.id, report);
                    } else {
                      List<ValueVerticality> valueVerticalities = [];
                      for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                        ValueVerticality valueVerticality = ValueVerticality(
                            theodoliteIndex: 1,
                            section: i + 1,
                            miringKe: miringKe[i],
                            value: valueT1Con[i].text != ''
                                ? int.parse(valueT1Con[i].text)
                                : 0);
                        valueVerticalities.add(valueVerticality);
                      }
                      for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                        ValueVerticality valueVerticality = ValueVerticality(
                            theodoliteIndex: 2,
                            section: i + 1,
                            miringKe: miringKe2[i],
                            value: valueT2Con[i].text != ''
                                ? int.parse(valueT2Con[i].text)
                                : 0);
                        valueVerticalities.add(valueVerticality);
                      }
                      ReportRegVerticality report = ReportRegVerticality(
                          horizontalityAb:
                              horCon1.text != '' ? int.parse(horCon1.text) : 0,
                          horizontalityBc:
                              horCon2.text != '' ? int.parse(horCon2.text) : 0,
                          horizontalityCd:
                              horCon3.text != '' ? int.parse(horCon3.text) : 0,
                          horizontalityDa:
                              horCon4.text != '' ? int.parse(horCon4.text) : 0,
                          theodolite1: theodoliteValue,
                          theodolite2: theodoliteValue2,
                          alatUkur: alatUkurCon.text,
                          toleransiKetegakan: toleransiKetegakanMenara,
                          valueVerticality: valueVerticalities);
                      ref
                          .read(taskControllerProvider.notifier)
                          .saveReportVerticality(widget.task.id, report);
                    }
                  },
                  // onPressed: () async {
                  //   if (reports != null) {
                  //     for (int i = 0; i < reports!.length; i++) {
                  //       reports![i].remark = controllers[i].text;
                  //     }
                  //     ref
                  //         .read(taskControllerProvider.notifier)
                  //         .updateReportTorque(reports!);
                  //   }
                  // },
                  icon: const Icon(Icons.save)),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Container(
                color: const Color(0xFFEAEEF2),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 8, bottom: 20),
                child: Column(
                  children: [
                    _buildHorizotalityPoint(),
                    const SizedBox(height: 20),
                    _buildVerticalityPoint(),
                    const SizedBox(height: 20),
                    _buildAlatUkur(),
                    const SizedBox(height: 20),
                    _buildTolerasiKetegakanMenara(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizotalityPoint() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('HORIZONTALITY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            enabled: isEnable,
            controller: horCon1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi AB (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            enabled: isEnable,
            controller: horCon2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi BC (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            enabled: isEnable,
            controller: horCon3,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi CD (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            enabled: isEnable,
            controller: horCon4,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi DA (mm)'),
                hintText: "Please type value"),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalityPoint() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('VERTICALITY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Button TOP
                OutlinedButton(
                  onPressed: isEnable
                      ? () {
                          if (selectedIndexTheodolite.contains(1)) {
                            selectedIndexTheodolite.remove(1);
                            if (selectedIndexTheodolite.isNotEmpty) {
                              theodoliteValue = theodoliteItems[
                                  selectedIndexTheodolite[0] - 1];
                              miringKeItem = theodoliteValue.split('-');
                              for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                miringKe[i] = miringKeItem[0];
                              }
                              // miringKe[0] = miringKeItem[0];
                              // miringKe[1] = miringKeItem[0];
                              // miringKe[2] = miringKeItem[0];
                              // miringKe[3] = miringKeItem[0];
                            }
                          } else {
                            if (selectedIndexTheodolite.length < 2 &&
                                !selectedIndexTheodolite.contains(3)) {
                              selectedIndexTheodolite.add(1);
                              if (selectedIndexTheodolite.indexOf(1) == 0) {
                                theodoliteValue = theodoliteItems[0];
                                miringKeItem = theodoliteValue.split('-');
                                for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                  miringKe[i] = miringKeItem[0];
                                }
                                // miringKe[0] = miringKeItem[0];
                                // miringKe[1] = miringKeItem[0];
                                // miringKe[2] = miringKeItem[0];
                                // miringKe[3] = miringKeItem[0];
                              } else {
                                theodoliteValue2 = theodoliteItems[0];
                                miringKeItem2 = theodoliteValue2.split('-');
                                for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                  miringKe2[i] = miringKeItem2[0];
                                }
                                // miringKe2[0] = miringKeItem2[0];
                                // miringKe2[1] = miringKeItem2[0];
                                // miringKe2[2] = miringKeItem2[0];
                                // miringKe2[3] = miringKeItem2[0];
                              }
                            }
                          }
                          setState(() {});
                        }
                      : null,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(width: 1.5, color: Colors.black),
                  ),
                  child: Text(
                      '${selectedIndexTheodolite.indexOf(1) + 1 > 0 ? selectedIndexTheodolite.indexOf(1) + 1 : ''}'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button LEFT
                    OutlinedButton(
                      onPressed: isEnable
                          ? () {
                              if (selectedIndexTheodolite.contains(4)) {
                                selectedIndexTheodolite.remove(4);
                                if (selectedIndexTheodolite.isNotEmpty) {
                                  theodoliteValue = theodoliteItems[
                                      selectedIndexTheodolite[0] - 1];
                                  miringKeItem = theodoliteValue.split('-');
                                  for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                    miringKe[i] = miringKeItem[0];
                                  }
                                  // miringKe[0] = miringKeItem[0];
                                  // miringKe[1] = miringKeItem[0];
                                  // miringKe[2] = miringKeItem[0];
                                  // miringKe[3] = miringKeItem[0];
                                }
                              } else {
                                if (selectedIndexTheodolite.length < 2 &&
                                    !selectedIndexTheodolite.contains(2)) {
                                  selectedIndexTheodolite.add(4);
                                  if (selectedIndexTheodolite.indexOf(4) == 0) {
                                    theodoliteValue = theodoliteItems[3];
                                    miringKeItem = theodoliteValue.split('-');
                                    for (var i = 0;
                                        i < MAX_SECTION_NUMBER;
                                        i++) {
                                      miringKe[i] = miringKeItem[0];
                                    }
                                    // miringKe[0] = miringKeItem[0];
                                    // miringKe[1] = miringKeItem[0];
                                    // miringKe[2] = miringKeItem[0];
                                    // miringKe[3] = miringKeItem[0];
                                  } else {
                                    theodoliteValue2 = theodoliteItems[3];
                                    miringKeItem2 = theodoliteValue2.split('-');
                                    for (var i = 0;
                                        i < MAX_SECTION_NUMBER;
                                        i++) {
                                      miringKe2[i] = miringKeItem2[0];
                                    }
                                    // miringKe2[0] = miringKeItem2[0];
                                    // miringKe2[1] = miringKeItem2[0];
                                    // miringKe2[2] = miringKeItem2[0];
                                    // miringKe2[3] = miringKeItem2[0];
                                  }
                                }
                              }
                              setState(() {});
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(width: 1.5, color: Colors.black),
                      ),
                      child: Text(
                          '${selectedIndexTheodolite.indexOf(4) + 1 > 0 ? selectedIndexTheodolite.indexOf(4) + 1 : ''}'),
                    ),
                    Image.asset(
                      'assets/images/tower.png',
                      width: 100,
                      height: 100,
                    ),
                    // Button RIGHT
                    OutlinedButton(
                      onPressed: isEnable
                          ? () {
                              if (selectedIndexTheodolite.contains(2)) {
                                selectedIndexTheodolite.remove(2);
                                if (selectedIndexTheodolite.isNotEmpty) {
                                  theodoliteValue = theodoliteItems[
                                      selectedIndexTheodolite[0] - 1];
                                  miringKeItem = theodoliteValue.split('-');
                                  for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                    miringKe[i] = miringKeItem[0];
                                  }
                                  // miringKe[0] = miringKeItem[0];
                                  // miringKe[1] = miringKeItem[0];
                                  // miringKe[2] = miringKeItem[0];
                                  // miringKe[3] = miringKeItem[0];
                                }
                              } else {
                                if (selectedIndexTheodolite.length < 2 &&
                                    !selectedIndexTheodolite.contains(4)) {
                                  selectedIndexTheodolite.add(2);
                                  if (selectedIndexTheodolite.indexOf(2) == 0) {
                                    theodoliteValue = theodoliteItems[1];
                                    miringKeItem = theodoliteValue.split('-');
                                    for (var i = 0;
                                        i < MAX_SECTION_NUMBER;
                                        i++) {
                                      miringKe[i] = miringKeItem[0];
                                    }
                                    // miringKe[0] = miringKeItem[0];
                                    // miringKe[1] = miringKeItem[0];
                                    // miringKe[2] = miringKeItem[0];
                                    // miringKe[3] = miringKeItem[0];
                                  } else {
                                    theodoliteValue2 = theodoliteItems[1];
                                    miringKeItem2 = theodoliteValue2.split('-');
                                    for (var i = 0;
                                        i < MAX_SECTION_NUMBER;
                                        i++) {
                                      miringKe2[i] = miringKeItem2[0];
                                    }
                                    // miringKe2[0] = miringKeItem2[0];
                                    // miringKe2[1] = miringKeItem2[0];
                                    // miringKe2[2] = miringKeItem2[0];
                                    // miringKe2[3] = miringKeItem2[0];
                                  }
                                }
                              }
                              setState(() {});
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(width: 1.5, color: Colors.black),
                      ),
                      child: Text(
                          '${selectedIndexTheodolite.indexOf(2) + 1 > 0 ? selectedIndexTheodolite.indexOf(2) + 1 : ''}'),
                    ),
                  ],
                ),
                // Button BOTTOM
                OutlinedButton(
                  onPressed: isEnable
                      ? () {
                          if (selectedIndexTheodolite.contains(3)) {
                            selectedIndexTheodolite.remove(3);
                            if (selectedIndexTheodolite.isNotEmpty) {
                              theodoliteValue = theodoliteItems[
                                  selectedIndexTheodolite[0] - 1];
                              miringKeItem = theodoliteValue.split('-');
                              for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                miringKe[i] = miringKeItem[0];
                              }
                              // miringKe[0] = miringKeItem[0];
                              // miringKe[1] = miringKeItem[0];
                              // miringKe[2] = miringKeItem[0];
                              // miringKe[3] = miringKeItem[0];
                            }
                          } else {
                            if (selectedIndexTheodolite.length < 2 &&
                                !selectedIndexTheodolite.contains(1)) {
                              selectedIndexTheodolite.add(3);
                              if (selectedIndexTheodolite.indexOf(3) == 0) {
                                theodoliteValue = theodoliteItems[2];
                                miringKeItem = theodoliteValue.split('-');
                                for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                  miringKe[i] = miringKeItem[0];
                                }
                                // miringKe[0] = miringKeItem[0];
                                // miringKe[1] = miringKeItem[0];
                                // miringKe[2] = miringKeItem[0];
                                // miringKe[3] = miringKeItem[0];
                              } else {
                                theodoliteValue2 = theodoliteItems[2];
                                miringKeItem2 = theodoliteValue2.split('-');
                                for (var i = 0; i < MAX_SECTION_NUMBER; i++) {
                                  miringKe2[i] = miringKeItem2[0];
                                }
                                // miringKe2[0] = miringKeItem2[0];
                                // miringKe2[1] = miringKeItem2[0];
                                // miringKe2[2] = miringKeItem2[0];
                                // miringKe2[3] = miringKeItem2[0];
                              }
                            }
                          }
                          setState(() {});
                        }
                      : null,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(width: 1.5, color: Colors.black),
                  ),
                  child: Text(
                      '${selectedIndexTheodolite.indexOf(3) + 1 > 0 ? selectedIndexTheodolite.indexOf(3) + 1 : ''}'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Posisi Theodolite (T1)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Container(
                width: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(theodoliteValue,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              // DropdownButton(
              //   value: theodoliteValue,
              //   icon: const Icon(Icons.arrow_drop_down),
              //   elevation: 5,
              //   iconSize: 24,
              //   items: theodoliteItems
              //       .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     theodoliteValue = value!;
              //     miringKeItem = theodoliteValue.split('-');
              //     miringKe[0] = miringKeItem[0];
              //     miringKe[1] = miringKeItem[0];
              //     miringKe[1] = miringKeItem[0];
              //     miringKe[2] = miringKeItem[0];
              //     miringKe[3] = miringKeItem[0];
              //     selectedIndexTheodolite.clear();
              //     selectedIndexTheodolite
              //         .add(theodoliteItems.indexOf(value) + 1);
              //     setState(() {});
              //   },
              // )
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, child: Text('Section')),
              SizedBox(width: 70, child: Text('Miring ke')),
              SizedBox(width: 50, child: Text('Nilai')),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
            height: 1,
          ),
          for (int i = 0; i < MAX_SECTION_NUMBER; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50, child: Text('    ${i + 1}')),
                _dropdown(i),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enabled: isEnable,
                    controller: valueT1Con[i],
                    keyboardType: TextInputType.number,
                    // decoration: const InputDecoration(
                    //     label: Text('Kemiringan'), hintText: "value"),
                  ),
                )
              ],
            ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Posisi Theodolite (T2)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Container(
                width: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(theodoliteValue2,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              // DropdownButton(
              //   value: theodoliteValue2,
              //   icon: const Icon(Icons.arrow_drop_down),
              //   elevation: 5,
              //   iconSize: 24,
              //   items: theodoliteItems
              //       .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     theodoliteValue2 = value!;
              //     miringKeItem2 = theodoliteValue2.split('-');
              //     miringKe2[0] = miringKeItem2[0];
              //     miringKe2[1] = miringKeItem2[0];
              //     miringKe2[1] = miringKeItem2[0];
              //     miringKe2[2] = miringKeItem2[0];
              //     miringKe2[3] = miringKeItem2[0];
              //     selectedIndexTheodolite.clear();
              //     selectedIndexTheodolite
              //         .add(theodoliteItems.indexOf(value) + 1);
              //     setState(() {});
              //   },
              // )
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, child: Text('Section')),
              SizedBox(width: 70, child: Text('Miring ke')),
              SizedBox(width: 50, child: Text('Nilai')),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
            height: 1,
          ),
          for (int j = 0; j < MAX_SECTION_NUMBER; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50, child: Text('    ${j + 1}')),
                SizedBox(
                  width: 60,
                  child: DropdownButton(
                    value: miringKe2[j],
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    iconSize: 24,
                    items: miringKeItem2
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                    onChanged: isEnable
                        ? (String? value) {
                            setState(() {
                              miringKe2[j] = value!;
                            });
                          }
                        : null,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enabled: isEnable,
                    controller: valueT2Con[j],
                    keyboardType: TextInputType.number,
                    // decoration: const InputDecoration(
                    //     label: Text('Kemiringan'), hintText: "value"),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }

  SizedBox _dropdown(int i) {
    // debugPrint(
    //     "miringke : ${miringKe[i]} miringKeItem : ${miringKeItem.toString()}");
    return SizedBox(
      width: 60,
      child: DropdownButton(
        value: miringKe[i],
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 5,
        iconSize: 24,
        items: miringKeItem
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: isEnable
            ? (String? value) {
                setState(() {
                  miringKe[i] = value!;
                });
              }
            : null,
      ),
    );
  }

  Widget _buildAlatUkur() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ALAT UKUR YANG DIGUNAKAN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            enabled: isEnable,
            controller: alatUkurCon,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: "Enter Tools",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black))),
          ),
        ],
      ),
    );
  }

  Widget _buildTolerasiKetegakanMenara() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TOLERANSI KETEGAKAN MENARA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextField(
                  enabled: isEnable,
                  controller: toleransiKetegakanCon,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    toleransiKetegakanMenara = int.parse(value);
                    setState(() {});
                  },
                ),
              ),
              const Text('x (1/1000) ='),
              Text('${toleransiKetegakanMenara * (1 / 1000)} mm'),
              // Text('$toleransiKetegakanMenara mm'),
            ],
          ),
        ],
      ),
    );
  }

  warningDialog() {
    Widget closeButton = TextButton(
      child: const Text("Close"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      elevation: 0,
      title: const Text('Informasi'),
      content: const Text('Lengkapi Posisi Theodolite'),
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
}
