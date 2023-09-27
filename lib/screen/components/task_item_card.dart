import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/screen/album_screen.dart';

class TaskItemCard extends ConsumerStatefulWidget {
  final Asset asset;
  final Task task;
  const TaskItemCard({
    Key? key,
    required this.asset,
    required this.task,
  }) : super(key: key);

  @override
  ConsumerState<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends ConsumerState<TaskItemCard> {
  final TextEditingController textController = TextEditingController();
  late String description;

  @override
  void initState() {
    super.initState();
    description = widget.asset.description;
    textController.text = description;
  }

  copyWith(Task task) {
    return Task(
      id: task.id,
      type: task.type,
      site: task.site,
      verifierEmployee: task.verifierEmployee,
      createdDate: task.createdDate,
      submitedDate: task.submitedDate,
      verifiedDate: task.verifiedDate,
      status: task.status,
      masterAsset: task.masterAsset,
      masterChecklist: task.masterChecklist,
      masterReportRegTorque: task.masterReportRegTorque,
      assets: task.assets,
      categoriesChecklist: task.categoriesChecklist,
      reportRegTorque: task.reportRegTorque,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            // Task task = copyWith(widget.task);
            // int index = task.assets!
            //     .indexWhere((element) => element.id == widget.asset.id);
            // debugPrint('id : ${task.assets![index].description}');
            // task.assets![index].url = '-----';
            // ref.read(taskProvider.notifier).state = task;
            Navigator.of(context).pushNamed(AlbumScreen.routeName, arguments: true).then(
              (path) async {

                // UPDATE LOCAL DB
                ref
                    .read(localdataServiceProvider)
                    .updateAsset(widget.asset, path as String);

                // UPDATE TASK PROVIDER
                Task task = copyWith(widget.task);
                int index = task.assets!
                    .indexWhere((element) => element.id == widget.asset.id);
                task.assets![index].url = path;
                ref.read(taskProvider.notifier).state = task;
              },
            );
          },
          child: Container(
            height: 300,
            color: Colors.grey,
            child: Center(
                child: widget.asset.url != '-'
                    ? Image.file(File(widget.asset.url))
                    : const Icon(Icons.image)),
          ),
        ),
        Container(
          color: Colors.white,
          height: 80,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () => _displayTextInputDialog(context),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Change Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            content: TextField(
              controller: textController,
              maxLines: 3,
              decoration:
                  const InputDecoration(hintText: "Please type description"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    description = textController.text;
                    Navigator.pop(context, textController.text);
                  });
                },
              ),
            ],
          );
        });
  }
}
