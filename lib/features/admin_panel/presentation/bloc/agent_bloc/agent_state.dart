import 'package:equatable/equatable.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';

abstract class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object?> get props => [];
}

class AgentInitial extends AgentState {}

class AgentLoading extends AgentState {}

class AgentLoaded extends AgentState {
  final List<AgentModel> agents;

  const AgentLoaded(this.agents);

  @override
  List<Object?> get props => [agents];
}

class AgentError extends AgentState {
  final String message;

  const AgentError(this.message);

  @override
  List<Object?> get props => [message];
}