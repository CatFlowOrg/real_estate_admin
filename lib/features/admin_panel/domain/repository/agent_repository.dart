import '../../../../core/data_state/data_state.dart';
import '../../data/models/agent_model.dart';

abstract class AgentRepository {
  Future<DataState<List<AgentModel>>> getAgents(int language);
}
