import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../auth/data/models/login_user.dart';
import '../../auth/data/models/login_user_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://qa.palace.agency/api/')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/login')
  Future<HttpResponse<LoginUserResponse>> login(@Body() LoginUserModel model);
}
