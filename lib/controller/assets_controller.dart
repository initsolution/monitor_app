import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/asset.dart';

class AssetsController extends Notifier<List<Asset>> {
  late List<Asset> assets;

  @override
  List<Asset> build() {
    return [];
  }

  getAllAsset() async {}
}
