import 'package:equatable/equatable.dart';

abstract class AgentEvent extends Equatable {
  const AgentEvent();

  @override
  List<Object?> get props => [];
}

class LoadAgentsEvent extends AgentEvent {
  final int language;

  const LoadAgentsEvent({this.language = 0});

  @override
  List<Object?> get props => [language];
}