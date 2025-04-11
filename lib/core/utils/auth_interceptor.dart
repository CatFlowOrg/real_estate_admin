import 'package:dio/dio.dart';
import 'package:real_estate_admin/core/utils/auth_notifier.dart';
import 'package:real_estate_admin/core/api_service/api_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final AuthNotifier _authNotifier;
  final AuthApiService _authApiService;


  AuthInterceptor(
      this._authNotifier,
      this._authApiService,
      );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authNotifier.authToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshed = await _handleRefreshToken();
        if (refreshed) {
          final requestOptions = err.requestOptions;
          final newRequest = await _retryRequest(requestOptions);
          return handler.resolve(newRequest);
        } else {
          _authNotifier.logout();
        }
      } catch (e) {
        _authNotifier.logout();
      }
    }
    return handler.next(err);
  }


  Future<bool> _handleRefreshToken() async {
    final refreshToken = _authNotifier.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      final response = await _authApiService.getToken(refreshToken);
      if (response.response.statusCode == 200) {
        final newAccessToken = response.data.authToken;
        final newRefreshToken = response.data.refreshToken;


        await _authNotifier.login(newAccessToken, newRefreshToken);
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }


  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {

    final newDio = Dio();
    newDio.options = requestOptions.connectTimeout == null
        ? BaseOptions()
        : BaseOptions(
      connectTimeout: requestOptions.connectTimeout!,
      receiveTimeout: requestOptions.receiveTimeout,
    );



    final token = _authNotifier.authToken;
    if (token != null && token.isNotEmpty) {
      requestOptions.headers['Authorization'] = 'Bearer $token';
    }

    return newDio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
        validateStatus: requestOptions.validateStatus,
      ),
      cancelToken: requestOptions.cancelToken,
    );
  }
}
