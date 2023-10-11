// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/screen/album_screen.dart';

import '../model/task.dart';

class TemuanItemCard extends ConsumerStatefulWidget {
  final Task task;
  const TemuanItemCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  ConsumerState<TemuanItemCard> createState() => _TemuanItemCardState();
}

class _TemuanItemCardState extends ConsumerState<TemuanItemCard> {
  final TextEditingController textController = TextEditingController();
  late String description;

  @override
  void initState() {
    super.initState();
    description = 'Deskripsi';
  }

  Task copyWith(Task task) {
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
            Navigator.of(context)
                .pushNamed(AlbumScreen.routeName, arguments: true)
                .then(
              (path) async {
                // UPDATE LOCAL DB
                // ref
                //     .read(localdataServiceProvider)
                //     .updateAsset(widget.asset, path as String);

                // UPDATE TASK PROVIDER
                // Task task = copyWith(widget.task);
                // int index = task.assets!
                //     .indexWhere((element) => element.id == widget.asset.id);
                // task.assets![index].url = path as String;
                // ref.read(taskProvider.notifier).state = task;
              },
            );
          },
          child: Container(
            height: 300,
            color: Colors.grey,
            child: const Center(
              child: Icon(Icons.image),
            ),
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
