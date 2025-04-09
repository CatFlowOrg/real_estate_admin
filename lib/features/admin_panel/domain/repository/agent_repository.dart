import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';

abstract class AgentRepository {
  Future<DataState<List<AgentModel>>> getAgents(int language);
}