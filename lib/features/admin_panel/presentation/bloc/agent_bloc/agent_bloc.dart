import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/agent_model.dart';
import '../../../domain/usecase/get_agent_use_case.dart';

import 'agent_event.dart';
import 'agent_state.dart';

@Injectable()
class AgentBloc extends Bloc<AgentEvent, AgentState> {
  List<AgentModel>? _cachedAgents;
  final GetAgentsUseCase getAgentsUseCase;

  AgentBloc(this.getAgentsUseCase) : super(AgentInitial()) {
    on<LoadAgentsEvent>(_onLoadAgents);
  }

  Future<void> _onLoadAgents(LoadAgentsEvent event,
      Emitter<AgentState> emit,) async {
    if (_cachedAgents != null) {
      emit(AgentLoaded(_cachedAgents!));
      return;
    }

    emit(AgentLoading());

    final dataState =
    await getAgentsUseCase(params: event.language);

    if (dataState.isSuccess && dataState.data != null) {
      _cachedAgents = dataState.data!;
      emit(AgentLoaded(_cachedAgents!));
    } else {
      emit(AgentError(dataState.message ?? 'Unknown error'));
    }
  }
}