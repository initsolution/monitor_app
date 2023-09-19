// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:monitor_app/model/task.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@RestApi(baseUrl: urlRepo)
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @GET('/task')
  Future<List<Task>> getAllTaskByNIK(@Queries() Map<String, dynamic> queries);
}
