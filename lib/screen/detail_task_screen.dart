// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/screen/components/task_item_card.dart';
import 'package:monitor_app/model/asset.dart';

class DetailTaskScreen extends ConsumerStatefulWidget {
  final String statusTask;
  final String title;
  final List<Asset> assets;
  const DetailTaskScreen({
    Key? key,
    required this.statusTask,
    required this.title,
    required this.assets,
  }) : super(key: key);

  @override
  ConsumerState<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends ConsumerState<DetailTaskScreen> {
  late List<Asset> _assets;

  @override
  void initState() {
    super.initState();
    _assets = widget.assets;
  }

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
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: _assets.length,
          itemBuilder: (context, index) {
            // return TaskItemCard(
            //     asset: widget.assets[index], task: state);
            return TaskItemCard(
              statusTask : widget.statusTask,
              asset: _assets[index],
              onPickImage: (String url) async {
                _assets[index].url = url;
                await ref
                    .read(taskControllerProvider.notifier)
                    .updateAssetLocalTask(_assets[index]);
              },
              onUpdateDescription: (String description) async {
                _assets[index].description = description;
                await ref
                    .read(taskControllerProvider.notifier)
                    .updateAssetLocalTask(_assets[index]);
              },
            );
          },
        ),
      ],
    );
  }
}
