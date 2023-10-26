import 'package:flutter/material.dart';

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
      case 'todo':
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
      case 'review':
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
      case 'verified':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFF48DC23),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Verified',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      case 'revision':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: const Color(0xFFF60000),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Revision',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        );
      default:
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
    }
  }
}
