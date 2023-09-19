import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/mstate/report_reg_torque_state.dart';
import 'package:monitor_app/controller/app_provider.dart';

class ReportRegTorqueNotifier
    extends AutoDisposeNotifier<ReportRegTorqueState> {
  @override
  ReportRegTorqueState build() {
    return ReportRegTorqueInitial();
  }

  getAllMasterReportRegTorque(String fabricator, int towerHeight) async {
    state = ReportRegTorqueLoading();
    try {
      final torques = await ref
          .read(repositoryProvider)
          .getAllMasterReportRegTorque(fabricator, towerHeight);
      state = ReportRegTorqueLoaded(points: torques);
    } on Exception catch (e) {
      state = ReportRegTorqueLoadedWithError(message: e.toString());
    }
  }
  
  // @override
  // ReportRegTorqueState build(Param arg) {
  //   return ReportRegTorqueInitial();
  // }
}
