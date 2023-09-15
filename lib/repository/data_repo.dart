// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:monitor_app/model/task.dart';
import 'package:retrofit/retrofit.dart';

part 'data_repo.g.dart';

@RestApi(baseUrl: urlRepo)
abstract class DataRepository {
  factory DataRepository(Dio dio, {String baseUrl}) = _DataRepository;

  @GET('/task')
  Future<List<Task>> getAllTaskByNIK(@Queries() Map<String, dynamic> queries);
}
