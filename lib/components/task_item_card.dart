import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/asset.dart';

import '../controller/taskdb_controller.dart';

class TaskItemCard extends ConsumerStatefulWidget {
  final Asset asset;
  const TaskItemCard({
    Key? key,
    required this.asset,
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

  @override
  Widget build(BuildContext context) {
    // var value = ref.watch(localdataServiceProvider.select((value) => value.toString()));
    // debugPrint('valueee : $value');
    return Column(
      children: [
        InkWell(
          onTap: () async {
            var result =
                await Navigator.of(context).pushNamed('album', arguments: true);
            debugPrint('result pick image : $result');
            var asset = widget.asset;
            await ref
                .read(localdataServiceProvider)
                .updateAsset(asset, result.toString());
            final localTasks =
                await ref.read(localdataServiceProvider).getAllTasks();
            ref.read(taskDbProvider.notifier).state = localTasks;
          },
          child: Container(
            height: 300,
            color: Colors.grey,
            child: const Center(child: Icon(Icons.image)),
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
