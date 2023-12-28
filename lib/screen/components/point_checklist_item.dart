// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:monitor_app/constants/enum.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/model/point_checklist_preventive.dart';

class PointChecklistItem extends ConsumerStatefulWidget {
  final PointChecklistPreventive pointChecklist;
  final bool isEditable;

  const PointChecklistItem(
      {Key? key, required this.pointChecklist, required this.isEditable})
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
    if (pointChecklist.isChecklist) {
      if (pointChecklist.hasil.toLowerCase() == 'ok') {
        ckValue = ChecklistValue.ok;
      } else if (pointChecklist.hasil.toLowerCase() == 'na') {
        ckValue = ChecklistValue.na;
      } else if (pointChecklist.hasil.toLowerCase() == 'notok') {
        ckValue = ChecklistValue.notok;
      }
    } else {
      ckValue = ChecklistValue.notok;
    }
    uraian = pointChecklist.uraian;
    uraianTextController.text = uraian;
    kriteria = pointChecklist.kriteria ?? "";
    kriteriaTextController.text = kriteria;
  }

  @override
  void dispose() {
    uraianTextController.dispose();
    kriteriaTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pointChecklist.isChecklist) {
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
              onTap: () =>
                  widget.isEditable ? _displayUraianDialog(context) : null,
              child: Text(
                pointChecklist.uraian,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () =>
                  widget.isEditable ? _displayKriteriaDialog(context) : null,
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
    } else {
      // SUB CATEGORY
      return Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 217, 228, 233),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () =>
                  widget.isEditable ? _displayUraianDialog(context) : null,
              child: Text(
                pointChecklist.uraian,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () =>
                  widget.isEditable ? _displayKriteriaDialog(context) : null,
              child: Text(pointChecklist.kriteria ?? ""),
            ),
          ],
        ),
      );
    }
  }

  Widget buildChecklistButton(ChecklistValue value, String text) {
    // debugPrint("checkButton : ${pointChecklist.hasil} = ${value.name}");
    return OutlinedButton(
      onPressed: widget.isEditable
          ? () {
              pointChecklist.hasil = value.name;
              ref
                  .read(taskControllerProvider.notifier)
                  .updatePointChecklist(pointChecklist);
              setState(() {
                ckValue = value;
              });
            }
          : null,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 40),
        backgroundColor: (pointChecklist.hasil.toLowerCase() == value.name)
            ? Colors.lightBlueAccent
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(
            width: 1.5,
            color: (pointChecklist.hasil.toLowerCase() == value.name)
                ? Colors.lightBlueAccent
                : Colors.black),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: (pointChecklist.hasil.toLowerCase() == value.name)
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
