// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/spref_controller.dart';
import 'package:monitor_app/repository/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:monitor_app/services/local_data_service.dart';
import 'package:monitor_app/services/rest_service.dart';

final authRepoProvider = Provider((ref) => AuthRepository(Dio()));
final preferenceManagerProvider = Provider((ref) => SPrefController());
final restServiceProvider = Provider((ref) => RestService(Dio()));
final localdataServiceProvider = Provider((ref) => LocalDataService());
final isEditableChecklist = StateProvider((ref) => true);
final assetUrlProvider = StateProvider((ref) => '');

final statusTaskProvider = StateProvider<String>((ref) => 'All');
final selectedTaskId = StateProvider<int>((ref) => 0);

// final masterAssetProvider =
//     FutureProvider.family<List<MasterAsset>, Param>((ref, params) async {
//   return await ref.read(repositoryProvider).getAllMasterAssetTask(
//         params.type,
//         params.fabricator,
//         params.towerHeight,
//       );
// });

// final pointChecklistProvider = AutoDisposeNotifierProvider<
//     PointChecklistPreventiveNotifier,
//     PointChecklistPreventiveState>(() => PointChecklistPreventiveNotifier());

// final reportRegTorqueProvider =
//     AutoDisposeNotifierProvider<ReportRegTorqueNotifier, ReportRegTorqueState>(
//   () => ReportRegTorqueNotifier(),
// );

// final reportRegTorqueProvider = NotifierProvider.autoDispose
//     .family<ReportRegTorqueNotifier, ReportRegTorqueState, Param>(
//   () {
//     return ReportRegTorqueNotifier();
//   },
// );
