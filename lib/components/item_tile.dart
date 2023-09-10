import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/utils/utils.dart';

class ItemTile extends StatefulWidget {
  final MasterAsset asset;
  const ItemTile({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
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
    return Stack(
      children: [
        InkWell(
          onTap: () =>
              Navigator.of(context).pushNamed('capture', arguments: true),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Center(child: Icon(Icons.image))),
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: hasTextOverflow(
                description,
                const TextStyle(fontSize: 14),
                maxWidth: 150,
              )
                  ? InkWell(
                      onTap: () => _displayTextInputDialog(context),
                      child: Marquee(
                        text: description,
                        scrollAxis: Axis.horizontal,
                        blankSpace: 50,
                        velocity: 50,
                        showFadingOnlyWhenScrolling: true,
                        accelerationCurve: Curves.linear,
                      ),
                    )
                  : InkWell(
                      onTap: () => _displayTextInputDialog(context),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
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
            title: const Text(
              "Change Description",
              style: TextStyle(fontSize: 16),
            ),
            content: TextField(
              controller: textController,
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
