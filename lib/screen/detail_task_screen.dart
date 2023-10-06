// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/screen/components/task_item_card.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/asset.dart';

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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final state = ref.watch(taskProvider);
    return CustomScrollView(
      slivers: [
        Consumer(
          builder: (context, ref, child) {
            if (state != null) {
              return SliverList.builder(
                itemCount: widget.assets.length,
                itemBuilder: (context, index) {
                  return TaskItemCard(
                      asset: widget.assets[index], task: state);
                },
              );
              // return GridView.builder(
              //   itemCount: widget.assets.length,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8,
              //     mainAxisSpacing: 8,
              //     childAspectRatio: 0.46,
              //   ),
              //   itemBuilder: (context, index) {
              //     return TaskItemCard(
              //         asset: widget.assets[index], task: state);
              //   },
              // );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
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
