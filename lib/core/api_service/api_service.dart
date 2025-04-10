import 'package:dio/dio.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user_response.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: 'https://qa.palace.agency/api/')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/login')
  Future<HttpResponse<LoginUserResponse>> login(@Body() LoginUserModel model);

  @GET('/Agents')
  Future<HttpResponse<List<AgentModel>>> getAgents(@Query('Language') int language);

  /* -------------------Real Estate--------------------------- */
  @GET("/RealEstates/filter/active")
  Future<HttpResponse<RealEstateResponse>> getRealEstates();


}
