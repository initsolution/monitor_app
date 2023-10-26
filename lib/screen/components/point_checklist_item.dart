// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:monitor_app/constants/enum.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/model/point_checklist_preventive.dart';

class PointChecklistItem extends ConsumerStatefulWidget {
  final PointChecklistPreventive pointChecklist;
  const PointChecklistItem({Key? key, required this.pointChecklist})
      : super(key: key);

  @override
  ConsumerState<PointChecklistItem> createState() => _PointChecklistItemState();
}

class _PointChecklistItemState extends ConsumerState<PointChecklistItem> {
  final TextEditingController uraianTextController = TextEditingController();
  final TextEditingController kriteriaTextController = TextEditingController();
  late String uraian;
  late String kriteria;
  late ChecklistValue ckValue;
  late PointChecklistPreventive pointChecklist;

  @override
  void initState() {
    pointChecklist = widget.pointChecklist;
    super.initState();
    if (pointChecklist.hasil.toLowerCase() == 'ok') {
      ckValue = ChecklistValue.ok;
    } else if (pointChecklist.hasil.toLowerCase() == 'na') {
      ckValue = ChecklistValue.na;
    } else if (pointChecklist.hasil.toLowerCase() == 'notok') {
      ckValue = ChecklistValue.notok;
    }
    uraian = pointChecklist.uraian;
    uraianTextController.text = uraian;
    kriteria = pointChecklist.kriteria ?? "";
    kriteriaTextController.text = kriteria;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _displayUraianDialog(context),
            child: Text(
              pointChecklist.uraian,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => _displayKriteriaDialog(context),
            child: Text(pointChecklist.kriteria ?? ""),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildChecklistButton(ChecklistValue.ok, "OK"),
              buildChecklistButton(ChecklistValue.notok, "NOT OK"),
              buildChecklistButton(ChecklistValue.na, "NA"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildChecklistButton(ChecklistValue value, String text) {
    return OutlinedButton(
      onPressed: () {
        pointChecklist.hasil = value.name;
        ref
            .read(taskControllerProvider.notifier)
            .updatePointChecklist(pointChecklist);
        setState(() {
          ckValue = value;
        });
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 40),
        backgroundColor: (pointChecklist.hasil == value.name)
            ? Colors.lightBlueAccent
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(
            width: 1.5,
            color: (pointChecklist.hasil == value.name)
                ? Colors.lightBlueAccent
                : Colors.black),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: (pointChecklist.hasil == value.name)
                ? Colors.white
                : Colors.black),
      ),
    );
  }

  Future<void> _displayUraianDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Uraian",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            content: TextField(
              controller: uraianTextController,
              maxLines: 3,
              decoration:
                  const InputDecoration(hintText: "Silahkan isi uraian"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    uraian = uraianTextController.text;
                    pointChecklist.uraian = uraian;
                    ref
                        .read(taskControllerProvider.notifier)
                        .updatePointChecklist(pointChecklist);
                    Navigator.pop(context, uraianTextController.text);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayKriteriaDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Kriteria",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            content: TextField(
              controller: kriteriaTextController,
              maxLines: 3,
              decoration:
                  const InputDecoration(hintText: "Silahkan isi kriteria"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    kriteria = kriteriaTextController.text;
                    pointChecklist.kriteria = kriteria;
                    ref
                        .read(taskControllerProvider.notifier)
                        .updatePointChecklist(pointChecklist);
                    Navigator.pop(context, kriteriaTextController.text);
                  });
                },
              ),
            ],
          );
        });
  }
}
