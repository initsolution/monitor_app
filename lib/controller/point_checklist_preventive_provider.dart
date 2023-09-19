import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/mstate/point_checklist_preventive_state.dart';
import 'package:monitor_app/controller/app_provider.dart';

class PointChecklistPreventiveNotifier
    extends AutoDisposeNotifier<PointChecklistPreventiveState> {
  // PointChecklistPreventiveNotifier();

  @override
  PointChecklistPreventiveState build() {
    return PointChecklistPreventiveInitial();
  }

  getAllMasterPointChecklistPreventive() async {
    // state = PointChecklistPreventiveLoading();
    // try {
    //   final points = await ref
    //       .read(repositoryProvider)
    //       .getAllMasterPointChecklistPreventive();
    //   state = PointChecklistPreventiveLoaded(checklist: points);
    // } on Exception catch (e) {
    //   state = PointChecklistPreventiveLoadedWithError(message: e.toString());
    // }
  }
}
