import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

abstract class EsignState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EsignInitial extends EsignState {}

class EsignLoading extends EsignState {}

class EsignPicked extends EsignState {
  final FilePickerResult? esign;
  EsignPicked({required this.esign});

  @override
  List<Object?> get props => [esign];
}

class EsignSuccesUpdate extends EsignState {}

class EsignErrorUpdate extends EsignState {
  final String message;

  EsignErrorUpdate({required this.message});

  @override
  List<Object?> get props => [message];
}
