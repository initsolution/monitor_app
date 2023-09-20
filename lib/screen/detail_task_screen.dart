// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:monitor_app/components/item_tile.dart';
import 'package:monitor_app/components/task_item_card.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/master_asset.dart';

class DetailTaskScreen extends StatefulWidget {
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
  State<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends State<DetailTaskScreen> {
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
  }
}
