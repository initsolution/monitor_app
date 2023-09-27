import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:monitor_app/screen/components/icon_task_status.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/constants/images.dart';
import 'package:monitor_app/screen/task_screen.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('status : ${task.status}');
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(TaskScreen.routeName,
          arguments: task), //context.goNamed('task', extra: task),
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
