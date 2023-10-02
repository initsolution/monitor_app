import 'package:equatable/equatable.dart';
import 'package:monitor_app/model/asset.dart';

abstract class AssetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AssetInitial extends AssetState {}

class AssetLoading extends AssetState {}

class AssetLoaded extends AssetState {
  final List<Asset> assets;
  AssetLoaded({required this.assets});

  @override
  List<Object?> get props => [assets];
}

class AssetLoadedWithError extends AssetState {
  final String message;
  AssetLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}

class AssetDataChangeSuccess extends AssetState {}
