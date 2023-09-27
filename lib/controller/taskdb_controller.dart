import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/model/task.dart';

List<Task> task = [];

final taskDbProvider = StateProvider<List<Task>>((ref) => task);
