// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:monitor_app/constants/images.dart';
import 'package:monitor_app/helpers/format_helper.dart';
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
                  Text(
                    formatTanggalIndonesia(task.created_at, 2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              IconTaskStatus(taskStatus: task.status),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${task.site.id} - ${task.site.name}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          task.dueDate != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                          color: selisihTanggal(task.dueDate!) > 3
                              ? Colors.black
                              : Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Due Date: ${formatTanggalIndonesia(task.dueDate!, 3)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    _buildDaysLeft(task.dueDate!)
                  ],
                )
              : Container(),
        ]),
      ),
    );
  }

  Widget _buildDaysLeft(String dueDate) {
    int selisih = selisihTanggal(dueDate);
    if (selisih > 0) {
      return Text(
        "${selisih}d left",
        style: TextStyle(
            color: (selisih <= 3) ? Colors.red : Colors.black,
            fontWeight: FontWeight.bold),
      );
    } else if (selisih == 0) {
      return const Text(
        "today",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        "expired",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      );
    }
  }

  // SvgPicture _buildTodoIcon(String todoType) {
  //   if (todoType.toLowerCase() == 'regular') {
  //     return SvgPicture.asset(
  //       icTaskRegular,
  //       width: 32,
  //       height: 32,
  //     );
  //   } else {
  //     return SvgPicture.asset(
  //       icTaskPreventive,
  //       width: 32,
  //       height: 32,
  //     );
  //   }
  // }
}
