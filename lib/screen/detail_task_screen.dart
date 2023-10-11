// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/screen/components/task_item_card.dart';
import 'package:monitor_app/model/asset.dart';

class DetailTaskScreen extends ConsumerStatefulWidget {
  final String title;
  final List<Asset> assets;
  const DetailTaskScreen({
    Key? key,
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
    debugPrint("rebuild DetailTaskScreen");
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
        // Consumer(
        //   builder: (context, ref, child) {
        //     if (state is TaskLoaded) {
        //       return SliverList.builder(
        //         itemCount: _assets.length,
        //         itemBuilder: (context, index) {
        //           // return TaskItemCard(
        //           //     asset: widget.assets[index], task: state);
        //           return TaskItemCard(
        //             asset: _assets[index],
        //             onPickImage: (String url) async {
        //               _assets[index].url = url;
        //             },
        //             onUpdateDescription: (String description) {
        //               _assets[index].description = description;
        //             },
        //           );
        //         },
        //       );
        //     } else if (state is TaskLoadedWithError) {
        //       return Center(child: Text(state.message));
        //     } else {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   updateAssets();
  // }

  updateAssets() async {
    await ref
        .read(taskControllerProvider.notifier)
        .updateAssetsLocalTask(_assets);
  }

  // Widget _buildBody() {
  //   final state = ref.watch(taskProvider);
  //   return Column(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           color: const Color(0xFFEAEEF2),
  //           padding: const EdgeInsets.all(10),
  //           child: Consumer(
  //             builder: (context, ref, child) {
  //               if (state != null) {
  //                 return GridView.builder(
  //                   itemCount: widget.assets.length,
  //                   gridDelegate:
  //                       const SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisCount: 2,
  //                     crossAxisSpacing: 8,
  //                     mainAxisSpacing: 8,
  //                     childAspectRatio: 0.46,
  //                   ),
  //                   itemBuilder: (context, index) {
  //                     return TaskItemCard(
  //                         asset: widget.assets[index], task: state);
  //                   },
  //                 );
  //               } else {
  //                 return Container();
  //               }
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
