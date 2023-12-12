import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:monitor_app/constants/strings.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/controller/esign_controller.dart';
import 'package:monitor_app/model/account.dart';
import 'package:monitor_app/mstate/esign_state.dart';
import 'package:monitor_app/screen/login_screen.dart';

class AccountScreen extends ConsumerStatefulWidget {
  final Account account;
  const AccountScreen({Key? key, required this.account}) : super(key: key);

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  // late UserPreferences pref;
  FilePickerResult? result;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   pref = await ref.read(preferenceManagerProvider).getUserData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleAccountScreen),
        actions: [
          IconButton(
            onPressed: () async => showDialog(
              context: context,
              builder: (context) {
                return _showDialoglogout();
              },
            ),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    var state = ref.watch(esignController);
    ref.listen<EsignState>(esignController, (previous, next) {
      if (next is EsignSuccesUpdate) {}
    });
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NIK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  widget.account.nik,
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            const Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  widget.account.name,
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  widget.account.email,
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            const Text(
              'HP',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  widget.account.hp,
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            const Text(
              'Instansi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  widget.account.instansi ?? "",
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            const Text(
              'E-Sign',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Consumer(builder: (context, ref, child) {
              debugPrint(state.toString());
              if (state is EsignPicked) {
                String path = state.esign?.files[0].path ?? "";
                return Column(
                  children: [
                    InkWell(
                      onTap: () => pickFile(),
                      child: Container(
                        height: 300,
                        color: Colors.grey[200],
                        child: path != ""
                            ? Center(child: Image.file(File(path)))
                            : const Center(child: Text("Not Found")),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size.fromHeight(40), // NEW
                        ),
                        onPressed: () {
                          ref.read(esignController.notifier).updateEsign(
                              widget.account, result!.files.first.bytes);
                        },
                        icon: const Icon(
                          Icons.upload_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Upload',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                );
              }
              if (state is EsignLoading) {
                return Container(
                  height: 300,
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else {
                return FutureBuilder(
                  future: ref.read(preferenceManagerProvider).getEsignData(),
                  builder: (context, snapshot) {
                    imageCache.clear();
                    debugPrint("snapshot : ${snapshot.data}");
                    if (snapshot.hasData) {
                      return InkWell(
                        onTap: () => pickFile(),
                        child: Container(
                          height: 300,
                          color: Colors.grey[200],
                          child: snapshot.data != ''
                              ? Center(
                                  child: Image.network(
                                    '$urlRepo/employee/getImage/${widget.account.nik}',
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const Center(child: Text("Not Found")),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () => pickFile(),
                        child: Container(
                          height: 300,
                          color: Colors.grey[200],
                          child: const Center(child: Text("Not Found")),
                        ),
                      );
                    }
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    // result = await FilePicker.platform.pickFiles(
    //   dialogTitle: 'Get E-Sign',
    //   type: FileType.custom,
    //   allowMultiple: false,
    //   onFileLoading: (FilePickerStatus status) {
    //     if (status == FilePickerStatus.done) {
    //       debugPrint('finish pick');
    //       // ref.read(backgroundIsDonePickFile.notifier).state = true;
    //       // context
    //       //     .read<BackgroundBloc>()
    //       //     .add(SetStatusPickFileBackground(statusPick: true));
    //     }
    //   },
    //   allowedExtensions: ['png'],
    // );
    result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Get E-Sign',
      withData: true,
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png'],
    );

    if (result == null) {
      debugPrint("No file selected");
    } else {
      ref.read(esignController.notifier).pickedEsign(result);
      // ref
      //     .read(esignController.notifier)
      //     .updateEsign(widget.account.nik, result!.files.first.bytes);
    }
  }

  _logout() {
    ref.read(preferenceManagerProvider).clearUserData();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }

  _showDialoglogout() {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(onPressed: () => _logout(), child: const Text('Ya')),
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Tidak'))
      ],
      title: const Text('Keluar Aplikasi'),
      content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
    );
  }
}
