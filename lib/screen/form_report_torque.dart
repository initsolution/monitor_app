import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/helpers/utils.dart';
import 'package:monitor_app/model/report_reg_torque.dart';
import 'package:monitor_app/model/task.dart';

class FormReportTorque extends ConsumerStatefulWidget {
  static String routeName = 'report_torque';
  final Task task;
  const FormReportTorque({super.key, required this.task});

  @override
  ConsumerState<FormReportTorque> createState() => _FormReportTorqueState();
}

class _FormReportTorqueState extends ConsumerState<FormReportTorque> {
  late List<TextEditingController> controllers;
  late List<ReportRegTorque>? reports;
  bool isEnable = true;

  @override
  void initState() {
    super.initState();
    controllers = [];
    if (widget.task.reportRegTorque != null) {
      reports = widget.task.reportRegTorque!
        ..sort(
          (a, b) => a.orderIndex.compareTo(b.orderIndex),
        );
    } else {
      reports = null;
    }

    if (widget.task.status.toLowerCase() == STATUS_TODO) {
      isEnable = true;
    } else {
      isEnable = false;
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
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
        appBar: AppBar(
          title: const Text('Rep. Bolt Tightening Torque'),
          actions: [
            if (widget.task.status.toLowerCase() == STATUS_TODO)
              IconButton(
                  onPressed: () async {
                    if (reports != null) {
                      for (int i = 0; i < reports!.length; i++) {
                        reports![i].remark = controllers[i].text;
                      }
                      ref
                          .read(taskControllerProvider.notifier)
                          .updateReportTorque(reports!);
                    }
                  },
                  icon: const Icon(Icons.save)),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xFFEAEEF2),
          child:
              reports != null ? _buildListReportTorque(reports!) : Container(),
        ),
      ),
    );
  }

  ListView _buildListReportTorque(List<ReportRegTorque> report) {
    return ListView.separated(
        itemBuilder: (context, index) {
          debugPrint(report[index].toString());
          controllers
              .add(TextEditingController()..text = report[index].remark ?? '');
          return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report[index].towerSegment.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('Elevasi (Mm) : ${report[index].elevasi}'),
                  Text('Bolt Size (Dia. Mm): ${report[index].boltSize}'),
                  Text('Minimum Torque : ${report[index].minimumTorque}NM'),
                  Text('Qty Bolt : ${report[index].qtyBolt} Pcs'),
                  const SizedBox(height: 20),
                  const Text('Remark/Temuan : '),
                  TextField(
                    enabled: isEnable,
                    controller: controllers[index],
                    decoration:
                        const InputDecoration(hintText: "Please type remark"),
                  ),
                ],
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: report.length);
  }
}
