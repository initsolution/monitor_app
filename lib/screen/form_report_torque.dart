import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
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
  @override
  void initState() {
    super.initState();
    controllers = [];
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(reportRegTorqueProvider.notifier).getAllMasterReportRegTorque(
    //       widget.task.site.fabricator, widget.task.site.towerHeight);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final result = ref.watch(reportRegTorqueProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Torque'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFEAEEF2),
        child: widget.task.masterReportRegTorque != null
            ? _buildListReportTorque(widget.task.masterReportRegTorque!)
            : Container(),
        // child: Consumer(
        //   builder: (context, ref, child) {
        //     if (result is ReportRegTorqueLoading) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (result is ReportRegTorqueLoaded) {
        //       return _buildListReportTorque(result);
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
      ),
    );
  }

  ListView _buildListReportTorque(List<MasterReportRegTorque> report) {
    return ListView.separated(
        itemBuilder: (context, index) {
          controllers.add(TextEditingController());
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
                  Text(
                      'Minimum Torque : ${report[index].minimumTorque}NM'),
                  Text('Qty Bolt : ${report[index].qtyBolt} Pcs'),
                  const SizedBox(height: 20),
                  const Text('Remark/Temuan : '),
                  TextField(
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
  // ListView _buildListReportTorque(ReportRegTorqueLoaded result) {
  //   return ListView.separated(
  //       itemBuilder: (context, index) {
  //         controllers.add(TextEditingController());
  //         return Container(
  //             padding: const EdgeInsets.all(20),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   result.points[index].towerSegment.toUpperCase(),
  //                   style: const TextStyle(
  //                       fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //                 Text('Elevasi (Mm) : ${result.points[index].elevasi}'),
  //                 Text('Bolt Size (Dia. Mm): ${result.points[index].boltSize}'),
  //                 Text(
  //                     'Minimum Torque : ${result.points[index].minimumTorque}NM'),
  //                 Text('Qty Bolt : ${result.points[index].qtyBolt} Pcs'),
  //                 const SizedBox(height: 20),
  //                 const Text('Remark/Temuan : '),
  //                 TextField(
  //                   controller: controllers[index],
  //                   decoration: const InputDecoration(
  //                       hintText: "Please type remark"),
  //                 ),
  //               ],
  //             ));
  //       },
  //       separatorBuilder: (context, index) => const SizedBox(height: 10),
  //       itemCount: result.points.length);
  // }
}
