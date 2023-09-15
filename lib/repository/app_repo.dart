import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/master_point_checklist_preventive.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
import 'package:monitor_app/model/task.dart';

abstract class AppRepository {
  // Future<HttpResponse> login(String username, String password);
  Future<List<Task>> getAllTasks(String nik);
  Future<Task> getTaskById();
  Future<List<MasterAsset>> getAllMasterAssetTask(
      String type, String fabricator, int towerHeight);
  Future<List<MasterPointChecklistPreventive>>
      getAllMasterPointChecklistPreventive();
  Future<List<MasterReportRegTorque>> getAllMasterReportRegTorque(
      String fabricator, int towerHeight);
}
