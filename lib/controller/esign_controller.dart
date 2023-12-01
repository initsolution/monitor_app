import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/account.dart';
import 'package:monitor_app/mstate/esign_state.dart';

final esignController =
    AutoDisposeNotifierProvider<EsignController, EsignState>(
        () => EsignController());

class EsignController extends AutoDisposeNotifier<EsignState> {
  @override
  EsignState build() {
    return EsignInitial();
  }

  pickedEsign(FilePickerResult? esign) {
    state = EsignPicked(esign: esign);
  }

  updateEsign(Account account, List<int>? file) async {
    if (file != null) {
      if (file.isNotEmpty) {
        state = EsignLoading();
        debugPrint('nik : ${account.nik}');
        debugPrint('file : ${file.toString()}');
        final httpResponse =
            await ref.read(restServiceProvider).updateEmployeeWithFile(
                  account.nik,
                  account.name,
                  account.email,
                  account.hp,
                  '',
                  file,
                );
        debugPrint(httpResponse.response.toString());
        if (httpResponse.response.statusCode == 200) {
          String esign = httpResponse.response.data['urlEsign'];
          debugPrint('esign : $esign');
          await ref
              .read(preferenceManagerProvider)
              .setEsignData(esign);
          state = EsignSuccesUpdate();
        }
      }
    } else {
      state = EsignErrorUpdate(message: 'File not found!');
    }
  }
}
