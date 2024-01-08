import 'package:flutter/material.dart';
import 'package:monitor_app/constants/constants.dart';

class IconTaskStatus extends StatelessWidget {
  final String taskStatus;
  const IconTaskStatus({
    Key? key,
    required this.taskStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint(taskStatus);
    switch (taskStatus.toLowerCase()) {
      case STATUS_TODO:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFF005EFF),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'To Do',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      case STATUS_REVIEW:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFFFF9900),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Review',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      case STATUS_ACCEPTED:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFF48DC23),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Accepted',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      case STATUS_REJECTED:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFFF60000),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Rejected',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      case STATUS_EXPIRED:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFFA2A2A2),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Expired',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      default:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFF000000),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Unknown',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
    }
  }
}
