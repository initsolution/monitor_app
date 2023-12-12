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
  Future<List<Task>> getAllTaskByNIK(@Queries() Map<String, dynamic> queries,
      @Header('Authorization') String token);

  @PATCH('/task/{id}')
  Future<HttpResponse> updateTaskByTaskId(
      @Path() int id, @Body() var task, @Header('Authorization') String token);

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
      @Header('Authorization') String token,
      @Header('task-id') int taskIdHeader);

  @POST('/reportregulertorque/bulk')
  Future<HttpResponse> createReportRegTorque(
      @Body() var bulk, @Header('Authorization') String token);

  @POST('/reportregulerverticality')
  Future<HttpResponse> createReportRegVerticality(
      @Body() var bulk, @Header('Authorization') String token);

  @POST('/categorychecklistpreventive/insertWithPoint')
  Future<HttpResponse> createPointChecklistPreventive(
      @Body() var bulk, @Header('Authorization') String token);

  @PATCH('/employee/updateWithFile/{nik}')
  @MultiPart()
  Future<HttpResponse> updateEmployeeWithFile(
    @Path() String nik,
    @Part(name: 'name') String? name,
    @Part(name: 'email') String? email,
    @Part(name: 'hp') String? hp,
    @Part(name: 'password') String? password,
    @Part(contentType: 'image/png', fileName: 'esign', name: 'file')
    List<int> file,
  );
}
