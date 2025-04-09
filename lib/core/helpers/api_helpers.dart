import 'package:retrofit/retrofit.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';

DataState<T> handleHttpResponse<T>(HttpResponse<T> response) {
  final statusCode = response.response.statusCode ?? 0;

  if (statusCode >= 200 && statusCode < 300) {
    return DataState.success(response.data);
  } else {
    return DataState.error(
      response.response.statusMessage ?? 'Unexpected error',
    );
  }
}
