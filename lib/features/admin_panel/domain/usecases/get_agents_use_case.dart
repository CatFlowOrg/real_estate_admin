import 'package:injectable/injectable.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/models/agent_model.dart';
import '../repository/agent_repository.dart';

/// Params class for GetAgentsUseCase
class GetAgentsParams {
  final int language;

  GetAgentsParams(this.language);
}

@Injectable()
class GetAgentsUseCase implements UseCase<DataState<List<AgentModel>>, GetAgentsParams> {
  final AgentRepository repository;

  GetAgentsUseCase(this.repository);

  @override
  Future<DataState<List<AgentModel>>> call({GetAgentsParams? params}) {
    return repository.getAgents(params!.language);
  }
}
