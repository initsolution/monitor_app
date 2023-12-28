// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';

import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/screen/components/point_checklist_item.dart';

class FormChecklistScreen extends ConsumerStatefulWidget {
  static String routeName = 'checklist';
  final List<CategoryChecklistPreventive> checklist;
  const FormChecklistScreen({Key? key, required this.checklist})
      : super(key: key);
  // final int taskId;
  // const FormChecklistScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  ConsumerState<FormChecklistScreen> createState() =>
      _FormChecklistScreenState();
}

class _FormChecklistScreenState extends ConsumerState<FormChecklistScreen> {
  // late Map<int, ChecklistValue> values;
  // late List<CategoryChecklistPreventive> checklist;
  @override
  void initState() {
    super.initState();
    // checklist = widget.checklist;
    // for (var e in checklist) {
    //   debugPrint('opo before: ${e.orderIndex} ${e.categoryName}');
    // }
    // checklist.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    // for (var e in checklist) {
    //   debugPrint('opo after: ${e.orderIndex} ${e.categoryName}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Checklist'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFEAEEF2),
        child: buildListPointsChecklist(),
      ),
    );
  }

  Widget buildListPointsChecklist() {
    return ListView.separated(
        itemBuilder: (context, index) {
          CategoryChecklistPreventive c = widget.checklist[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${c.categoryName.toUpperCase()} (${c.points?.length})',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Consumer(builder: (context, ref, child) {
                bool isEditable = ref.watch(isEditableChecklist);
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => PointChecklistItem(
                          pointChecklist: c.points![index],
                          isEditable: isEditable,
                        ),
                    // _buildChecklistItem(checklist, index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: c.points != null ? c.points!.length : 0);
              }),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: widget.checklist.length);
  }
}
