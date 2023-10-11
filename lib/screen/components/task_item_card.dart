import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/screen/album_screen.dart';

class TaskItemCard extends ConsumerStatefulWidget {
  final Asset asset;
  final Function(String url) onPickImage;
  final Function(String description) onUpdateDescription;

  const TaskItemCard({
    Key? key,
    required this.asset,
    required this.onPickImage,
    required this.onUpdateDescription,
  }) : super(key: key);

  @override
  ConsumerState<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends ConsumerState<TaskItemCard> {
  final TextEditingController textController = TextEditingController();
  late String description;
  late String url;

  @override
  void initState() {
    super.initState();
    description = widget.asset.description;
    textController.text = description;

    url = widget.asset.url;
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
                .then((path) async {
              if (path != null) {
                widget.onPickImage(path as String);
                setState(() {
                  url = path;
                });
              }
            }

                    // (path) async {
                    //   ref
                    //       .read(taskControllerProvider.notifier)
                    //       .updateAssetLocalTask(Asset(
                    //         id: widget.asset.id,
                    //         section: widget.asset.section,
                    //         category: widget.asset.category,
                    //         description: widget.asset.description,
                    //         url: path as String,
                    //         createdDate: widget.asset.createdDate,
                    //         orderIndex: widget.asset.orderIndex,
                    //       ));

                    // UPDATE LOCAL DB
                    // ref.read(localdataServiceProvider).updateAsset(
                    //       Asset(
                    //         id: widget.asset.id,
                    //         section: widget.asset.section,
                    //         category: widget.asset.category,
                    //         description: widget.asset.description,
                    //         url: path as String,
                    //         createdDate: widget.asset.createdDate,
                    //         orderIndex: widget.asset.orderIndex,
                    //       ),
                    //     );

                    // UPDATE TASK PROVIDER
                    // Task task = ref.read(taskProvider.notifier).state!;

                    // Task newTask = copyWith(task);
                    // int index = newTask.assets!
                    //     .indexWhere((element) => element.id == widget.asset.id);
                    // newTask.assets![index].url = path;
                    // ref.read(taskProvider.notifier).state = newTask;
                    // },
                    );
          },
          child: Container(
            height: 300,
            color: Colors.grey,
            child: Center(
                child: url != '-'
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
                    widget.onUpdateDescription(description);
                    Navigator.pop(context, textController.text);
                  });
                },
              ),
            ],
          );
        });
  }
}
