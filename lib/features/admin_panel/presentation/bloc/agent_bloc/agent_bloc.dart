import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:real_estate_admin/features/admin_panel/domain/usecase/get_agent_use_case.dart';

import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_event.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_state.dart';

@Injectable()
class AgentBloc extends Bloc<AgentEvent, AgentState> {
  List<AgentModel>? _cachedAgents;
  final GetAgentsUseCase getAgentsUseCase;

  AgentBloc(this.getAgentsUseCase) : super(AgentInitial()) {
    on<LoadAgentsEvent>(_onLoadAgents);
  }

  Future<void> _onLoadAgents(
    LoadAgentsEvent event,
    Emitter<AgentState> emit,
  ) async {
    if (_cachedAgents != null) {
      emit(AgentLoaded(_cachedAgents!));
      return;
    }

    emit(AgentLoading());

// test 1: simulate empty list
    emit(const AgentLoaded([]));

// test 2: simulate delay + empty list
    await Future.delayed(const Duration(seconds: 4));
    emit(const AgentLoaded([]));

// test 3: simulate error
    emit(const AgentError("API not reachable"));


    final dataState = await getAgentsUseCase(params: event.language);

    if (dataState.isSuccess && dataState.data != null) {
      _cachedAgents = dataState.data!;
      emit(AgentLoaded(_cachedAgents!));
    } else {
      emit(AgentError(dataState.message ?? 'Unknown error'));
    }
  }
}
