// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:monitor_app/controller/asset_controller.dart';
import 'package:monitor_app/controller/task_controller.dart';

import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/mstate/asset_state.dart';
import 'package:monitor_app/screen/components/temuan_item_card.dart';

class TemuanScreen extends ConsumerStatefulWidget {
  final List<Asset>? asset;
  final String section;
  final int taskId;

  const TemuanScreen(
      {Key? key, this.asset, required this.section, required this.taskId})
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
    Future(() => ref
        .read(assetControllerProvider.notifier)
        .getAllTemuanByTaskId(widget.taskId, widget.section));
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
                  createdDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  orderIndex: widget.asset!.length + 1,
                );
                // setState(() {
                //   assets.add(temuan);
                // });
                await ref
                    .read(assetControllerProvider.notifier)
                    .addAssetToTask(widget.taskId, temuan);
                // await ref.read(taskControllerProvider.notifier).ad
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var state = ref.watch(assetControllerProvider);
    if (state is AssetLoaded) {
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
                  debugPrint('id temuan : ${state.assets[index].id} section: ${state.assets[index].section}');
                  return TemuanItemCard(
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
    // return assets.isNotEmpty
    //     ? CustomScrollView(
    //         slivers: [
    //           Consumer(builder: (context, ref, child) {
    //             if (state is AssetLoaded) {
    //               return SliverList.builder(
    //                 itemCount: state.assets.length,
    //                 itemBuilder: (context, index) => TemuanItemCard(
    //                   asset: assets[index],
    //                   onPickImage: (String url) async {
    //                     assets[index].url = url;
    //                     await ref
    //                         .read(taskControllerProvider.notifier)
    //                         .updateAssetLocalTask(assets[index]);
    //                   },
    //                   onUpdateDescription: (String description) async {
    //                     assets[index].description = description;
    //                     await ref
    //                         .read(taskControllerProvider.notifier)
    //                         .updateAssetLocalTask(assets[index]);
    //                   },
    //                 ),
    //               );
    //             } else {
    //               return const Center(child: CircularProgressIndicator());
    //             }
    //           })
    //         ],
    //       )
    //     : const Center(child: Text('Belum ada Temuan'));
  }
}
