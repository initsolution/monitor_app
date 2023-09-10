// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:monitor_app/model/task.dart';

class FormReportVerticality extends StatefulWidget {
  static String routeName = 'report_verticality';

  final Task task;
  const FormReportVerticality({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<FormReportVerticality> createState() => _FormReportVerticalityState();
}

class _FormReportVerticalityState extends State<FormReportVerticality> {
  TextEditingController horCon1 = TextEditingController();
  TextEditingController horCon2 = TextEditingController();
  TextEditingController horCon3 = TextEditingController();
  TextEditingController horCon4 = TextEditingController();

  TextEditingController alatUkurCon = TextEditingController();
  TextEditingController toleransiKetegakanCon = TextEditingController();

  List<TextEditingController> valueT1Con = [];
  List<TextEditingController> valueT2Con = [];

  List<String> theodoliteItems = [
    'A-B',
    'B-C',
    'C-D',
    'D-A',
  ];

  late String theodoliteValue;
  late String theodoliteValue2;
  List<String> miringKe = [];
  List<String> miringKe2 = [];
  late List<String> miringKeItem;
  late List<String> miringKeItem2;
  double toleransiKetegakanMenara = 0;

  List<int> selectedIndexTheodolite = [];
  @override
  void initState() {
    super.initState();
    theodoliteValue = theodoliteItems[0];
    theodoliteValue2 = theodoliteItems[0];
    miringKeItem = theodoliteItems[0].split('-');
    miringKeItem2 = theodoliteItems[0].split('-');
    for (int i = 0; i < 4; i++) {
      miringKe.add(miringKeItem[0]);
      miringKe2.add(miringKeItem2[0]);
      valueT1Con.add(TextEditingController());
      valueT2Con.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Report Verticality'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: Container(
              color: const Color(0xFFEAEEF2),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 8, bottom: 20),
              child: Column(
                children: [
                  _buildHorizotalityPoint(),
                  const SizedBox(height: 20),
                  _buildVerticalityPoint(),
                  const SizedBox(height: 20),
                  _buildAlatUkur(),
                  const SizedBox(height: 20),
                  _buildTolerasiKetegakanMenara(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizotalityPoint() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('HORIZONTALITY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            controller: horCon1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi AB (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            controller: horCon1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi BC (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            controller: horCon1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi CD (mm)'),
                hintText: "Please type value"),
          ),
          TextField(
            controller: horCon1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text('Terhadap titik level Pondasi DA (mm)'),
                hintText: "Please type value"),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalityPoint() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('VERTICALITY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Button TOP
                OutlinedButton(
                  onPressed: () {
                    if (selectedIndexTheodolite.contains(1)) {
                      selectedIndexTheodolite.remove(1);
                      if (selectedIndexTheodolite.isNotEmpty) {
                        theodoliteValue =
                            theodoliteItems[selectedIndexTheodolite[0] - 1];
                        miringKeItem = theodoliteValue.split('-');
                        miringKe[0] = miringKeItem[0];
                        miringKe[1] = miringKeItem[0];
                        miringKe[1] = miringKeItem[0];
                        miringKe[2] = miringKeItem[0];
                        miringKe[3] = miringKeItem[0];
                      }
                    } else {
                      if (selectedIndexTheodolite.length < 2 &&
                          !selectedIndexTheodolite.contains(3)) {
                        selectedIndexTheodolite.add(1);
                        if (selectedIndexTheodolite.indexOf(1) == 0) {
                          theodoliteValue = theodoliteItems[0];
                          miringKeItem = theodoliteValue.split('-');
                          miringKe[0] = miringKeItem[0];
                          miringKe[1] = miringKeItem[0];
                          miringKe[1] = miringKeItem[0];
                          miringKe[2] = miringKeItem[0];
                          miringKe[3] = miringKeItem[0];
                        } else {
                          theodoliteValue2 = theodoliteItems[0];
                          miringKeItem2 = theodoliteValue2.split('-');
                          miringKe2[0] = miringKeItem2[0];
                          miringKe2[1] = miringKeItem2[0];
                          miringKe2[1] = miringKeItem2[0];
                          miringKe2[2] = miringKeItem2[0];
                          miringKe2[3] = miringKeItem2[0];
                        }
                      }
                    }
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(width: 1.5, color: Colors.black),
                  ),
                  child: Text(
                      '${selectedIndexTheodolite.indexOf(1) + 1 > 0 ? selectedIndexTheodolite.indexOf(1) + 1 : ''}'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button LEFT
                    OutlinedButton(
                      onPressed: () {
                        if (selectedIndexTheodolite.contains(4)) {
                          selectedIndexTheodolite.remove(4);
                          if (selectedIndexTheodolite.isNotEmpty) {
                            theodoliteValue =
                                theodoliteItems[selectedIndexTheodolite[0] - 1];
                            miringKeItem = theodoliteValue.split('-');
                            miringKe[0] = miringKeItem[0];
                            miringKe[1] = miringKeItem[0];
                            miringKe[1] = miringKeItem[0];
                            miringKe[2] = miringKeItem[0];
                            miringKe[3] = miringKeItem[0];
                          }
                        } else {
                          if (selectedIndexTheodolite.length < 2 &&
                              !selectedIndexTheodolite.contains(2)) {
                            selectedIndexTheodolite.add(4);
                            if (selectedIndexTheodolite.indexOf(4) == 0) {
                              theodoliteValue = theodoliteItems[3];
                              miringKeItem = theodoliteValue.split('-');
                              miringKe[0] = miringKeItem[0];
                              miringKe[1] = miringKeItem[0];
                              miringKe[1] = miringKeItem[0];
                              miringKe[2] = miringKeItem[0];
                              miringKe[3] = miringKeItem[0];
                            } else {
                              theodoliteValue2 = theodoliteItems[3];
                              miringKeItem2 = theodoliteValue2.split('-');
                              miringKe2[0] = miringKeItem2[0];
                              miringKe2[1] = miringKeItem2[0];
                              miringKe2[1] = miringKeItem2[0];
                              miringKe2[2] = miringKeItem2[0];
                              miringKe2[3] = miringKeItem2[0];
                            }
                          }
                        }
                        setState(() {});
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(width: 1.5, color: Colors.black),
                      ),
                      child: Text(
                          '${selectedIndexTheodolite.indexOf(4) + 1 > 0 ? selectedIndexTheodolite.indexOf(4) + 1 : ''}'),
                    ),
                    Image.asset(
                      'assets/images/tower.png',
                      width: 100,
                      height: 100,
                    ),
                    // Button RIGHT
                    OutlinedButton(
                      onPressed: () {
                        if (selectedIndexTheodolite.contains(2)) {
                          selectedIndexTheodolite.remove(2);
                          if (selectedIndexTheodolite.isNotEmpty) {
                            theodoliteValue =
                                theodoliteItems[selectedIndexTheodolite[0] - 1];
                            miringKeItem = theodoliteValue.split('-');
                            miringKe[0] = miringKeItem[0];
                            miringKe[1] = miringKeItem[0];
                            miringKe[1] = miringKeItem[0];
                            miringKe[2] = miringKeItem[0];
                            miringKe[3] = miringKeItem[0];
                          }
                        } else {
                          if (selectedIndexTheodolite.length < 2 &&
                              !selectedIndexTheodolite.contains(4)) {
                            selectedIndexTheodolite.add(2);
                            if (selectedIndexTheodolite.indexOf(2) == 0) {
                              theodoliteValue = theodoliteItems[1];
                              miringKeItem = theodoliteValue.split('-');
                              miringKe[0] = miringKeItem[0];
                              miringKe[1] = miringKeItem[0];
                              miringKe[1] = miringKeItem[0];
                              miringKe[2] = miringKeItem[0];
                              miringKe[3] = miringKeItem[0];
                            } else {
                              theodoliteValue2 = theodoliteItems[1];
                              miringKeItem2 = theodoliteValue2.split('-');
                              miringKe2[0] = miringKeItem2[0];
                              miringKe2[1] = miringKeItem2[0];
                              miringKe2[1] = miringKeItem2[0];
                              miringKe2[2] = miringKeItem2[0];
                              miringKe2[3] = miringKeItem2[0];
                            }
                          }
                        }
                        setState(() {});
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(width: 1.5, color: Colors.black),
                      ),
                      child: Text(
                          '${selectedIndexTheodolite.indexOf(2) + 1 > 0 ? selectedIndexTheodolite.indexOf(2) + 1 : ''}'),
                    ),
                  ],
                ),
                // Button BOTTOM
                OutlinedButton(
                  onPressed: () {
                    if (selectedIndexTheodolite.contains(3)) {
                      selectedIndexTheodolite.remove(3);
                      if (selectedIndexTheodolite.isNotEmpty) {
                        theodoliteValue =
                            theodoliteItems[selectedIndexTheodolite[0] - 1];
                        miringKeItem = theodoliteValue.split('-');
                        miringKe[0] = miringKeItem[0];
                        miringKe[1] = miringKeItem[0];
                        miringKe[1] = miringKeItem[0];
                        miringKe[2] = miringKeItem[0];
                        miringKe[3] = miringKeItem[0];
                      }
                    } else {
                      if (selectedIndexTheodolite.length < 2 &&
                          !selectedIndexTheodolite.contains(1)) {
                        selectedIndexTheodolite.add(3);
                        if (selectedIndexTheodolite.indexOf(3) == 0) {
                          theodoliteValue = theodoliteItems[2];
                          miringKeItem = theodoliteValue.split('-');
                          miringKe[0] = miringKeItem[0];
                          miringKe[1] = miringKeItem[0];
                          miringKe[1] = miringKeItem[0];
                          miringKe[2] = miringKeItem[0];
                          miringKe[3] = miringKeItem[0];
                        } else {
                          theodoliteValue2 = theodoliteItems[2];
                          miringKeItem2 = theodoliteValue2.split('-');
                          miringKe2[0] = miringKeItem2[0];
                          miringKe2[1] = miringKeItem2[0];
                          miringKe2[1] = miringKeItem2[0];
                          miringKe2[2] = miringKeItem2[0];
                          miringKe2[3] = miringKeItem2[0];
                        }
                      }
                    }
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(width: 1.5, color: Colors.black),
                  ),
                  child: Text(
                      '${selectedIndexTheodolite.indexOf(3) + 1 > 0 ? selectedIndexTheodolite.indexOf(3) + 1 : ''}'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Posisi Theodolite (T1)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Container(
                width: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(theodoliteValue,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              // DropdownButton(
              //   value: theodoliteValue,
              //   icon: const Icon(Icons.arrow_drop_down),
              //   elevation: 5,
              //   iconSize: 24,
              //   items: theodoliteItems
              //       .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     theodoliteValue = value!;
              //     miringKeItem = theodoliteValue.split('-');
              //     miringKe[0] = miringKeItem[0];
              //     miringKe[1] = miringKeItem[0];
              //     miringKe[1] = miringKeItem[0];
              //     miringKe[2] = miringKeItem[0];
              //     miringKe[3] = miringKeItem[0];
              //     selectedIndexTheodolite.clear();
              //     selectedIndexTheodolite
              //         .add(theodoliteItems.indexOf(value) + 1);
              //     setState(() {});
              //   },
              // )
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, child: Text('Section')),
              SizedBox(width: 70, child: Text('Miring ke')),
              SizedBox(width: 50, child: Text('Nilai')),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
            height: 1,
          ),
          for (int i = 0; i < 4; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50, child: Text('${i + 1}')),
                SizedBox(
                  width: 60,
                  child: DropdownButton(
                    value: miringKe[i],
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    iconSize: 24,
                    items: miringKeItem
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        miringKe[i] = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: valueT1Con[i],
                    keyboardType: TextInputType.number,
                    // decoration: const InputDecoration(
                    //     label: Text('Kemiringan'), hintText: "value"),
                  ),
                )
              ],
            ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Posisi Theodolite (T2)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Container(
                width: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(theodoliteValue2,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              // DropdownButton(
              //   value: theodoliteValue2,
              //   icon: const Icon(Icons.arrow_drop_down),
              //   elevation: 5,
              //   iconSize: 24,
              //   items: theodoliteItems
              //       .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     theodoliteValue2 = value!;
              //     miringKeItem2 = theodoliteValue2.split('-');
              //     miringKe2[0] = miringKeItem2[0];
              //     miringKe2[1] = miringKeItem2[0];
              //     miringKe2[1] = miringKeItem2[0];
              //     miringKe2[2] = miringKeItem2[0];
              //     miringKe2[3] = miringKeItem2[0];
              //     selectedIndexTheodolite.clear();
              //     selectedIndexTheodolite
              //         .add(theodoliteItems.indexOf(value) + 1);
              //     setState(() {});
              //   },
              // )
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, child: Text('Section')),
              SizedBox(width: 70, child: Text('Miring ke')),
              SizedBox(width: 50, child: Text('Nilai')),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
            height: 1,
          ),
          for (int j = 0; j < 4; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50, child: Text('${j + 1}')),
                SizedBox(
                  width: 60,
                  child: DropdownButton(
                    value: miringKe2[j],
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    iconSize: 24,
                    items: miringKeItem2
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        miringKe2[j] = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: valueT2Con[j],
                    keyboardType: TextInputType.number,
                    // decoration: const InputDecoration(
                    //     label: Text('Kemiringan'), hintText: "value"),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAlatUkur() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ALAT UKUR YANG DIGUNAKAN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            controller: alatUkurCon,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: "Enter Tools",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black))),
          ),
        ],
      ),
    );
  }

  Widget _buildTolerasiKetegakanMenara() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TOLERANSI KETEGAKAN MENARA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextField(
                  controller: toleransiKetegakanCon,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    toleransiKetegakanMenara = int.parse(value) * (1 / 1000);
                    setState(() {});
                  },
                ),
              ),
              const Text('x (1/1000) ='),
              Text('$toleransiKetegakanMenara mm'),
            ],
          ),
        ],
      ),
    );
  }
}
