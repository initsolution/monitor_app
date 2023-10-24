// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';

import '../model/asset.dart';
import '../mstate/asset_state.dart';

final assetControllerProvider =
    AutoDisposeNotifierProvider<AssetController, AssetState>(
  () {
    return AssetController();
  },
);

class AssetController extends AutoDisposeNotifier<AssetState> {
  // final DataRepository repository;
  // TaskController({required this.repository});

  @override
  AssetState build() {
    return AssetInitial();
  }

  uploadAsset(int idTask, Asset asset, String token) async {
    state = AssetLoading();
    // print('token $token');
    File file = File(asset.url);
    List<int> imageBytes = file.readAsBytesSync();
    final response = await ref.read(restServiceProvider).createAsset(
        asset.section,
        asset.category,
        asset.description,
        asset.note,
        asset.orderIndex,
        idTask,
        imageBytes,
        token);

    print('res : $response');
    // final response =
    //     await ref.read(restServiceProvider).createAsset(idTask, asset, token);
    // if (response.response.statusCode == 201) {
    //   state = AssetDataChangeSuccess();
    // }
  }

  getAllTemuanByTaskId(int taskId) async {
    state = AssetLoading();
    var temuan =
        await ref.read(localdataServiceProvider).getAllTemuanByTaskId(taskId);
    state = AssetLoaded(assets: temuan);
  }

  addAssetToTask(int taskId, Asset temuan) async {
    await ref.read(localdataServiceProvider).addAssetToTask(taskId, temuan);
    getAllTemuanByTaskId(taskId);
  }
}
