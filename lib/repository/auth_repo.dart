// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:monitor_app/constants/config.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repo.g.dart';

@RestApi(baseUrl: urlRepo)
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST('/employee/login')
  Future<HttpResponse> login(@Body() Map<String, dynamic> body);
}
