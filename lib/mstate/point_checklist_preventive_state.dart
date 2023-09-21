// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:monitor_app/model/master_checklist.dart';

abstract class PointChecklistPreventiveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PointChecklistPreventiveInitial extends PointChecklistPreventiveState {}

class PointChecklistPreventiveLoading extends PointChecklistPreventiveState {}

class PointChecklistPreventiveLoaded extends PointChecklistPreventiveState {
  final List<MasterChecklist> checklist;
  PointChecklistPreventiveLoaded({
    required this.checklist,
  });

  @override
  List<Object?> get props => [checklist];
}

class PointChecklistPreventiveLoadedWithError
    extends PointChecklistPreventiveState {
  final String message;

  PointChecklistPreventiveLoadedWithError({required this.message});
  @override
  List<Object?> get props => [message];
}
