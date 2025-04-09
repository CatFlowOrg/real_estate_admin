import 'package:injectable/injectable.dart';

import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:real_estate_admin/features/admin_panel/domain/repository/agent_repository.dart';

@Injectable()
class GetAgentsUseCase implements UseCase<DataState<List<AgentModel>>, int> {
  final AgentRepository repository;

  GetAgentsUseCase(this.repository);

  @override
  Future<DataState<List<AgentModel>>> call({int? params}) {
    final language = params ?? 0;
    return repository.getAgents(language);
  }
}