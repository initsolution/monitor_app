// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/components/task_item_card.dart';
import 'package:monitor_app/model/asset.dart';

import '../controller/taskdb_controller.dart';
import '../model/task.dart';

class DetailTaskScreen extends ConsumerStatefulWidget {
  final String title;
  // final List<MasterAsset> masterAsset;
  final List<Asset> assets;
  const DetailTaskScreen({
    Key? key,
    required this.title,
    // required this.masterAsset,
    required this.assets,
  }) : super(key: key);

  @override
  ConsumerState<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends ConsumerState<DetailTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var state = ref.watch(taskDbProvider);
    debugPrint('statebabi $state');
    return Consumer(
      builder: (context, ref, child) {
        List<Task> tasks = state;
        for (var task in tasks) {
          var assets = task.assets;
          debugPrint('length : ${assets!.length}');
          for(int i=0;i< assets.length; i++){
            debugPrint('master assets : ${assets[i].description} = ${assets[i].url}');
          }
        }
        return Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFEAEEF2),
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: widget.assets.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return TaskItemCard(asset: widget.assets[index]);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
