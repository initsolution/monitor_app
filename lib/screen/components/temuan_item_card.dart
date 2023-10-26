// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:monitor_app/constants/constants.dart';

import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/screen/album_screen.dart';

class TemuanItemCard extends ConsumerStatefulWidget {
  final String statusTask;
  final Asset asset;
  final Function(String url) onPickImage;
  final Function(String description) onUpdateDescription;
  const TemuanItemCard({
    Key? key,
    required this.statusTask,
    required this.asset,
    required this.onPickImage,
    required this.onUpdateDescription,
  }) : super(key: key);

  @override
  ConsumerState<TemuanItemCard> createState() => _TemuanItemCardState();
}

class _TemuanItemCardState extends ConsumerState<TemuanItemCard> {
  final TextEditingController textController = TextEditingController();
  late String description;
  late String url;

  @override
  void initState() {
    super.initState();
    description = 'Deskripsi';
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
            if (widget.statusTask == STATUS_TODO) {
              Navigator.of(context)
                  .pushNamed(AlbumScreen.routeName, arguments: true)
                  .then(
                (path) async {
                  if (path != null) {
                    widget.onPickImage(path as String);
                    setState(() {
                      url = path;
                    });
                  }
                },
              );
            }
          },
          child: Container(
            height: 300,
            color: Colors.grey,
            child: widget.statusTask == STATUS_TODO
                ? Center(
                    child: url != '-'
                        ? Image.file(File(widget.asset.url))
                        : const Icon(Icons.image),
                  )
                : Center(
                    child: Image.network(
                        '${urlRepo}/asset/getImage/${widget.asset.id}')),
          ),
        ),
        Container(
          color: Colors.white,
          height: 80,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              if (widget.statusTask == STATUS_TODO) {
                _displayTextInputDialog(context);
              }
            },
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
