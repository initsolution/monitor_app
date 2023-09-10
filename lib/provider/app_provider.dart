import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/param.dart';
import 'package:monitor_app/model/point_checklist_preventive_state.dart';
import 'package:monitor_app/model/report_reg_torque_state.dart';
import 'package:monitor_app/provider/point_checklist_preventive_provider.dart';
// import 'package:monitor_app/provider/report_reg_torque_provider.dart';
import 'package:monitor_app/repository/test_repo_impl.dart';

import 'report_reg_torque_provider.dart';

final repositoryProvider = Provider((ref) => TestRepoImpl());

final masterAssetProvider =
    FutureProvider.family<List<MasterAsset>, Param>((ref, params) async {
  return await ref.read(repositoryProvider).getAllMasterAssetTask(
        params.type,
        params.fabricator,
        params.towerHeight,
      );
});

final pointChecklistProvider = AutoDisposeNotifierProvider<
    PointChecklistPreventiveNotifier,
    PointChecklistPreventiveState>(() => PointChecklistPreventiveNotifier());

final reportRegTorqueProvider =
    AutoDisposeNotifierProvider<ReportRegTorqueNotifier, ReportRegTorqueState>(
  () => ReportRegTorqueNotifier(),
);

// final reportRegTorqueProvider = NotifierProvider.autoDispose
//     .family<ReportRegTorqueNotifier, ReportRegTorqueState, Param>(
//   () {
//     return ReportRegTorqueNotifier();
//   },
// );
