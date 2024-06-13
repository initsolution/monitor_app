import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/strings.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/task.dart';

class LocalDbTaskScreen extends ConsumerStatefulWidget {
  final List<Task>? localTask;
  LocalDbTaskScreen({Key? key, required this.localTask}) : super(key: key);

  @override
  ConsumerState<LocalDbTaskScreen> createState() => _LocalDbTaskScreen();
}

class _LocalDbTaskScreen extends ConsumerState<LocalDbTaskScreen> {
  // late UserPreferences pref;
  FilePickerResult? result;

  @override
  void initState() {
    super.initState();
    for (var element in widget.localTask!) {
      debugPrint('element : ${element.id}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleDbTaskScreen),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    List<LocalTaskData> data = [];
    List<Task>? tasks = widget.localTask;
    for (var task in tasks!) {
      List<Asset> assets = task.asset!;
      var nImage = 0;
      for (var asset in assets) {
        if ((asset.url != "-") && (asset.url != " ")) {
          nImage++;
        }
      }
      if (nImage > 0)
        data.add(LocalTaskData(
            taskId: task.id.toString(), siteId: task.site.id, nImage: nImage));
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task ID : ${data[index].taskId}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Site ID : ${data[index].siteId}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Image : ${data[index].nImage}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LocalTaskData {
  late String taskId;
  late String siteId;
  late int nImage;

  LocalTaskData({
    required this.taskId,
    required this.siteId,
    required this.nImage,
  });
}
