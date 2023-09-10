import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/master_point_checklist_preventive.dart';
import 'package:monitor_app/model/point_checklist_preventive_state.dart';
import 'package:monitor_app/provider/app_provider.dart';
import 'package:monitor_app/utils/enum.dart';

class FormChecklistScreen extends ConsumerStatefulWidget {
  static String routeName = 'checklist';
  const FormChecklistScreen({super.key});

  @override
  ConsumerState<FormChecklistScreen> createState() =>
      _FormChecklistScreenState();
}

class _FormChecklistScreenState extends ConsumerState<FormChecklistScreen> {
  late Map<int, ChecklistValue> values;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(pointChecklistProvider.notifier)
          .getAllMasterPointChecklistPreventive();
    });
    values = {};
  }

  @override
  Widget build(BuildContext context) {
    final mPointChecklist = ref.watch(pointChecklistProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Checklist'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFEAEEF2),
        child: Consumer(
          builder: (context, ref, child) {
            if (mPointChecklist is PointChecklistPreventiveLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (mPointChecklist is PointChecklistPreventiveLoaded) {
              return buildListPointsChecklist(mPointChecklist);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  ListView buildListPointsChecklist(
      PointChecklistPreventiveLoaded mPointChecklist) {
    return ListView.separated(
        itemBuilder: (context, index) {
          MasterPointChecklistPreventive point =
              mPointChecklist.pointsChecklist[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                point.categoryName.toUpperCase(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // PointChecklistCard(point: point),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(point.mpointchecklistpreventive[index].uraian,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(point
                                .mpointchecklistpreventive[index].kriteria),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildChecklistButton(
                                    point.mpointchecklistpreventive[index].id,
                                    ChecklistValue.ok,
                                    "OK"),
                                buildChecklistButton(
                                    point.mpointchecklistpreventive[index].id,
                                    ChecklistValue.notok,
                                    "NOT OK"),
                                buildChecklistButton(
                                    point.mpointchecklistpreventive[index].id,
                                    ChecklistValue.na,
                                    "NA"),
                                // OutlinedButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       values[point
                                //           .mpointchecklistpreventive[index]
                                //           .id] = ChecklistValue.notok;
                                //     });
                                //   },
                                //   style: OutlinedButton.styleFrom(
                                //     minimumSize: const Size(80, 40),
                                //     backgroundColor: (values[point
                                //                 .mpointchecklistpreventive[
                                //                     index]
                                //                 .id] ==
                                //             ChecklistValue.notok)
                                //         ? Colors.lightBlue
                                //         : Colors.transparent,
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 5, vertical: 5),
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(20)),
                                //     side: BorderSide(
                                //         color: (values[point
                                //                     .mpointchecklistpreventive[
                                //                         index]
                                //                     .id] ==
                                //                 ChecklistValue.notok)
                                //             ? Colors.lightBlue
                                //             : Colors.black),
                                //   ),
                                //   child: Text(
                                //     'NOT OK',
                                //     style: TextStyle(
                                //         color: (values[point
                                //                     .mpointchecklistpreventive[
                                //                         index]
                                //                     .id] ==
                                //                 ChecklistValue.notok)
                                //             ? Colors.white
                                //             : Colors.black),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: point.mpointchecklistpreventive.length),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: mPointChecklist.pointsChecklist.length);
  }

  Widget buildChecklistButton(int idPoint, ChecklistValue value, String text) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          values[idPoint] = value;
        });
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 40),
        backgroundColor: (values[idPoint] == value)
            ? Colors.lightBlueAccent
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(
            width: 1.5,
            color: (values[idPoint] == value)
                ? Colors.lightBlueAccent
                : Colors.black),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: (values[idPoint] == value) ? Colors.white : Colors.black),
      ),
    );
  }
}
