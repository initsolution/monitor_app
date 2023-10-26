// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  void initState() {
    super.initState();
    // values = {};
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
          CategoryChecklistPreventive checklist = widget.checklist[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                checklist.categoryName.toUpperCase(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => PointChecklistItem(
                      pointChecklist: checklist.points![index]),
                  // _buildChecklistItem(checklist, index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount:
                      checklist.points != null ? checklist.points!.length : 0),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: widget.checklist.length);
  }
}
