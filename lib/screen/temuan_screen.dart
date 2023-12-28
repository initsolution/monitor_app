// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/asset_controller.dart';
import 'package:monitor_app/controller/task_controller.dart';

import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/mstate/asset_state.dart';
import 'package:monitor_app/screen/components/temuan_item_card.dart';

class TemuanScreen extends ConsumerStatefulWidget {
  final List<Asset>? asset;
  final String section;
  // final int taskId;
  final Task task;

  const TemuanScreen(
      {Key? key, this.asset, required this.section, required this.task})
      : super(key: key);

  @override
  ConsumerState<TemuanScreen> createState() => _TemuanScreenState();
}

class _TemuanScreenState extends ConsumerState<TemuanScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('widget section : ${widget.section}');
    if (widget.task.status == STATUS_TODO) {
      Future(() => ref
          .read(assetControllerProvider.notifier)
          .getAllTemuanByTaskId(widget.task.id, widget.section));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temuan'),
        actions: [
          IconButton(
              onPressed: () async {
                Asset temuan = Asset(
                  section: widget.section,
                  category: 'TEMUAN',
                  description: 'Deskripsi Temuan',
                  url: '-',
                  orderIndex:
                      widget.asset![widget.asset!.length - 1].orderIndex + 1,
                );
                // setState(() {
                //   assets.add(temuan);
                // });
                await ref
                    .read(assetControllerProvider.notifier)
                    .addAssetToTask(widget.task.id, temuan);
                // await ref.read(taskControllerProvider.notifier).ad
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (widget.task.status == STATUS_TODO) {
      var state = ref.watch(assetControllerProvider);
      if (state is AssetLoaded) {
        var len = state.assets;
        debugPrint('len : $len');
        // debugPrint('jumlah temuan card : ${state.assets.length.toString()}');
        return CustomScrollView(
          slivers: [
            Consumer(
              builder: (context, ref, child) {
                // debugPrint('state : $state');

                // if (state is AssetLoaded) {
                return SliverList.builder(
                  itemCount: state.assets.length,
                  itemBuilder: (context, index) {
                    debugPrint(
                        'id temuan : ${state.assets[index].id} section: ${state.assets[index].section}');
                    return TemuanItemCard(
                      statusTask: widget.task.status,
                      asset: state.assets[index],
                      onPickImage: (String url) async {
                        state.assets[index].url = url;
                        await ref
                            .read(taskControllerProvider.notifier)
                            .updateAssetLocalTask(state.assets[index]);
                      },
                      onUpdateDescription: (String description) async {
                        state.assets[index].description = description;
                        await ref
                            .read(taskControllerProvider.notifier)
                            .updateAssetLocalTask(state.assets[index]);
                      },
                    );
                  },
                );
                // } else {
                //   return const Center(child: CircularProgressIndicator());
                // }
              },
            )
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    } else {
      List temuan = widget.asset!
          .where((element) => element.section == widget.section)
          .toList();
      return CustomScrollView(
        slivers: [
          Consumer(
            builder: (context, ref, child) {
              // debugPrint('state : $state');

              // if (state is AssetLoaded) {
              return SliverList.builder(
                itemCount: temuan.length,
                itemBuilder: (context, index) {
                  return TemuanItemCard(
                    statusTask: widget.task.status,
                    asset: temuan[index],
                    onPickImage: (String url) {},
                    onUpdateDescription: (String description) {},
                  );
                },
              );
              // } else {
              //   return const Center(child: CircularProgressIndicator());
              // }
            },
          )
        ],
      );
    }
  }
}
