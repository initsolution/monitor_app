
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/master_point_checklist_preventive.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/repository/app_repo.dart';

class TestRepoImpl extends AppRepository {
  // String NIK = '002';

  @override
  Future<List<Task>> getAllTasks(String nik) async {
    // try {
    //   List<Task> result = (jsonDecode(await loadJsonData('todo.json')) as List)
    //       .map((e) => Task.fromMap(e))
    //       .toList();
    //   if (nik == '001') {
    //     result = result
    //         .where((task) => task.type.toUpperCase() == "REGULAR")
    //         .toList();
    //   } else {
    //     result = result
    //         .where((task) => task.type.toUpperCase() == "PREVENTIVE")
    //         .toList();
    //   }
    //   return result;
    // } on Exception catch (e) {
    //   throw e.toString();
    // }
    return [];
  }

  @override
  Future<Task> getTaskById() {
    throw UnimplementedError();
  }

  @override
  Future<List<MasterAsset>> getAllMasterAssetTask(
      String type, String fabricator, int towerHeight) async {
    // try {
    //   String data = '';
    //   if (type.toLowerCase() == "preventive") {
    //     data = 'master_asset_preventive.json';
    //   } else {
    //     data = 'master_asset_regular.json';
    //   }
    //   final result = (jsonDecode(await loadJsonData(data)) as List)
    //       .map((e) => MasterAsset.fromMap(e))
    //       .toList();
    //   return result;
    // } on Exception catch (e) {
    //   throw e.toString();
    // }
    return [];
  }

  @override
  Future<List<MasterPointChecklistPreventive>>
      getAllMasterPointChecklistPreventive() async {
    // try {
    //   String data = 'master_checklist.json';
    //   final result = (jsonDecode(await loadJsonData(data)) as List)
    //       .map((e) => MasterPointChecklistPreventive.fromMap(e))
    //       .toList();
    //   return result;
    // } on Exception catch (e) {
    //   throw e.toString();
    // }
    return [];
  }

  @override
  Future<List<MasterReportRegTorque>> getAllMasterReportRegTorque(
      String fabricator, int towerHeight) async {
    // try {
    //   String data = 'master_report_reg_torque.json';
    //   final result = (jsonDecode(await loadJsonData(data)) as List)
    //       .map((e) => MasterReportRegTorque.fromMap(e))
    //       .toList();
    //   return result;
    // } on Exception catch (e) {
    //   throw e.toString();
    // }
    return [];
  }

  final String baseURL = '103.82.241.80';
  final int basePort = 3000;

  // @override
  // Future<Response> login(String username, String password) async {
  //   try {
  //     Uri uri = Uri(
  //         scheme: 'http',
  //         host: baseURL,
  //         port: basePort,
  //         path: 'employee/login');

  //     Map<String, String> body = {'email': username, 'password': password};
  //     Map<String, String> header = {
  //       'Content-Type': 'application/json; charset=UTF-8'
  //     };
  //     return post(uri, body: body, headers: header);
  //   } catch (e) {
  //     throw 'error server';
  //   }
  // }
}
