import 'package:injectable/injectable.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/models/agent_model.dart';
import '../repository/agent_repository.dart';

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