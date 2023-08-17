import 'package:flutter/services.dart';

Future<String> loadJsonData(String fileName) async =>
    await rootBundle.loadString('assets/data/$fileName');
