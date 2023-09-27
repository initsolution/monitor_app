// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/param.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/mstate/point_checklist_preventive_state.dart';
import 'package:monitor_app/mstate/report_reg_torque_state.dart';
import 'package:monitor_app/controller/point_checklist_preventive_provider.dart';
import 'package:monitor_app/repository/auth_repo.dart';
import 'package:monitor_app/repository/test_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:monitor_app/services/local_data_service.dart';
import 'package:monitor_app/services/rest_service.dart';
import 'report_reg_torque_provider.dart';

final repositoryProvider = Provider((ref) => TestRepoImpl());

final authRepoProvider = Provider((ref) => AuthRepository(Dio()));
final restServiceProvider = Provider((ref) => RestService(Dio()));
final localdataServiceProvider = Provider((ref) => LocalDataService());

final taskProvider = StateProvider<Task?>((ref) => null);

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
