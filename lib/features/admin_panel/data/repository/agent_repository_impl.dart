import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_service/api_service.dart';
import '../../../../core/data_state/data_state.dart';
import '../../domain/repository/agent_repository.dart';
import '../models/agent_model.dart';

@Injectable(as: AgentRepository)
class AgentRepositoryImpl implements AgentRepository {
  final AuthApiService api;

  AgentRepositoryImpl(this.api);

  @override
  Future<DataState<List<AgentModel>>> getAgents(int language) async {
    try {
      final response = await api.getAgents(language);
      final statusCode = response.response.statusCode ?? 0;

      if (statusCode >= 200 && statusCode < 300) {
        return DataState.success(response.data);
      } else {
        return DataState.error(
          response.response.statusMessage ?? 'Unexpected error',
        );
      }
    } on DioException catch (e) {
      return DataState.error(
        e.response?.statusMessage ?? e.message ?? 'Unknown error',
      );
    }
  }
}
