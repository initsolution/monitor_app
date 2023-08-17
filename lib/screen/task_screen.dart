import 'package:flutter/material.dart';

import 'package:monitor_app/model/task.dart';

class TaskScreen extends StatelessWidget {
  final Task task;
  const TaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.site.name),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Site Id : ${task.site.siteId}'),
              // Text('Name : ${todo.site.name}'),
              Text('Address : ${task.site.address ?? ''}'),
              Text('Height : ${task.site.towerHeight.toString()}'),
              Text('Type : ${task.site.towerType}'),
              Text('Fabricator : ${task.site.fabricator}'),
              Text('Region : ${task.site.region}'),
              // Text('Kabupaten : ${todo.site.kabupaten}'),
              Text('Province : ${task.site.province}'),
              Text('Created Date : ${task.createdDate}'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildAllRequirement(),
      ],
    );
  }

  Widget _buildAllRequirement() {
    return Expanded(
        child: Container(
      color: const Color(0xFFEAEEF2),
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('A'),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 20),
    ));
  }
}
