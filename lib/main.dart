import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/db/config/database.dart';
import 'package:monitor_app/screen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarInit();
  runApp(const ProviderScope(child: MainScreen()));
}
