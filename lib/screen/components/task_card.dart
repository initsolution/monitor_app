// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:monitor_app/constants/images.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/screen/components/icon_task_status.dart';

class TaskCard extends ConsumerWidget {
  final Task task;
  final Function() onSelectTask;
  const TaskCard({
    Key? key,
    required this.task,
    required this.onSelectTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // debugPrint("rebuild TaskCard");
    return InkWell(
      onTap: onSelectTask,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icCalendar,
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 10),
                  Text(task.createdDate)
                ],
              ),
              IconTaskStatus(taskStatus: task.status),
            ],
          ),
          const SizedBox(height: 10),
          Text('${task.site.id} - ${task.site.name}'),
          // const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       children: [
          //         SvgPicture.asset(
          //           icCalendar,
          //           width: 14,
          //           height: 14,
          //         ),
          //         const SizedBox(width: 10),
          //         Text(todo.createdDate)
          //       ],
          //     ),
          //   ],
          // ),
        ]),
      ),
    );
  }

  SvgPicture _buildTodoIcon(String todoType) {
    if (todoType.toLowerCase() == 'regular') {
      return SvgPicture.asset(
        icTaskRegular,
        width: 32,
        height: 32,
      );
    } else {
      return SvgPicture.asset(
        icTaskPreventive,
        width: 32,
        height: 32,
      );
    }
  }
}
