import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/report_reg_torque_db.dart';
import 'package:monitor_app/db/models/report_reg_verticality_db.dart';
import 'package:monitor_app/db/models/site_db.dart';
import 'package:monitor_app/db/models/value_verticality_db.dart';
import 'package:monitor_app/model/employee.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_verticality.dart';
import 'package:monitor_app/model/site.dart';
import 'package:monitor_app/model/value_verticality.dart';

SiteDB getSiteDBFromSite(Site site) => SiteDB()
  ..idSite = site.id
  ..name = site.name
  ..towerType = site.towerType
  ..towerHeight = site.towerHeight
  ..fabricator = site.fabricator
  ..tenants = site.tenants
  ..region = site.region
  ..province = site.province
  ..address = site.address
  ..longitude = site.longitude
  ..latitude = site.latitude;

EmployeeDB getEmployeeDBFromEmployee(Employee employee) {
  return EmployeeDB()
    ..nik = employee.nik
    ..name = employee.name
    ..email = employee.email
    ..hp = employee.hp
    ..isVendor = employee.isVendor
    ..urlEsign = employee.urlEsign
    ..instansi = employee.instansi;
}

ReportRegTorqueDB getReportTorqueDBFromMasterReportTorque(
        MasterReportRegTorque torque) =>
    ReportRegTorqueDB(
      towerSegment: torque.towerSegment,
      elevasi: torque.elevasi,
      boltSize: torque.boltSize,
      minimumTorque: torque.minimumTorque,
      qtyBolt: torque.qtyBolt,
    );

ReportRegVerticalityDB getReportRegVerticalityDBFromReportRegVerticality(
        ReportRegVerticality report) =>
    ReportRegVerticalityDB(
      id: report.id,
      horizontalityAb: report.horizontalityAb,
      horizontalityBc: report.horizontalityBc,
      horizontalityCd: report.horizontalityCd,
      horizontalityDa: report.horizontalityDa,
      theodolite1: report.theodolite1,
      theodolite2: report.theodolite2,
      alatUkur: report.alatUkur,
      toleransiKetegakan: report.toleransiKetegakan,
    )..valueVerticality.addAll(
        getListValueVerticalityDBFromListValueVerticality(
            report.valueVerticality!));

List<ValueVerticalityDB> getListValueVerticalityDBFromListValueVerticality(
    List<ValueVerticality> verticalities) {
  return verticalities
      .map((v) => ValueVerticalityDB(
          id: v.id,
          theodoliteIndex: v.theodoliteIndex,
          section: v.section,
          miringKe: v.miringKe,
          value: v.value))
      .toList();
}
  // PointChecklistDB  getPointChecklistDBFromMasterPointChecklistPreventive(MasterPointChecklistPreventive mpoint,{int idx})=>
