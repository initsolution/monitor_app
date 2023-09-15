import 'package:equatable/equatable.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';

abstract class ReportRegTorqueState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportRegTorqueInitial extends ReportRegTorqueState {}

class ReportRegTorqueLoading extends ReportRegTorqueState {}

class ReportRegTorqueLoaded extends ReportRegTorqueState {
  final List<MasterReportRegTorque> points;
  ReportRegTorqueLoaded({
    required this.points,
  });

  @override
  List<Object?> get props => [points];
}

class ReportRegTorqueLoadedWithError extends ReportRegTorqueState {
  final String message;

  ReportRegTorqueLoadedWithError({required this.message});
  @override
  List<Object?> get props => [message];
}
