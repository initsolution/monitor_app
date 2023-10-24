// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:monitor_app/model/task.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';

part 'rest_service.g.dart';

@RestApi(baseUrl: urlRepo)
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @GET('/task')
  Future<List<Task>> getAllTaskByNIK(@Queries() Map<String, dynamic> queries);

  @PATCH('/task/{id}')
  Future<HttpResponse> updateTaskByTaskId(
      @Path() int id, @Body() Task task);

  @POST('/asset')
  @MultiPart()
  Future<HttpResponse> createAsset(
      @Part(name: 'section') String section,
      @Part(name: 'category') String category,
      @Part(name: 'description') String description,
      @Part(name: 'note') String? note,
      @Part(name: 'orderIndex') int orderIndex,
      @Part(name: 'taskId') int taskId,
      @Part(contentType: 'image/jpg', fileName: 'asset', name: 'file')
      List<int> file,
      @Header('Authorization') String token);
}
