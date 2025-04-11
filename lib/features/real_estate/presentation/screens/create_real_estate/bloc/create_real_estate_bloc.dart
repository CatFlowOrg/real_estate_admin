import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class CreateRealEstateBloc extends Bloc<CreateRealEstateEvent, CreateRealEstateState> {
  CreateRealEstateBloc() : super(const CreateRealEstateState()) {
    on<GoToStep>(_goToStep);
    on<UpdateRealEstateTitle>(_updateTitle);
    on<UpdateRealEstateDescription>(_updateDescription);
    // Dodaj ostale step-ove ovde npr. UpdateFeatures, UpdateHashtags...
  }

  void _goToStep(GoToStep event, Emitter<CreateRealEstateState> emit) {
    emit(state.copyWith(currentStep: event.step));
  }

  void _updateTitle(UpdateRealEstateTitle event, Emitter<CreateRealEstateState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _updateDescription(UpdateRealEstateDescription event, Emitter<CreateRealEstateState> emit) {
    emit(state.copyWith(description: event.description));
  }
}


abstract class CreateRealEstateEvent extends Equatable {
  const CreateRealEstateEvent();

  @override
  List<Object?> get props => [];
}

class GoToStep extends CreateRealEstateEvent {
  final int step;

  const GoToStep(this.step);

  @override
  List<Object?> get props => [step];
}

class UpdateRealEstateTitle extends CreateRealEstateEvent {
  final String title;

  const UpdateRealEstateTitle(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateRealEstateDescription extends CreateRealEstateEvent {
  final String description;

  const UpdateRealEstateDescription(this.description);

  @override
  List<Object?> get props => [description];
}



class CreateRealEstateState extends Equatable {
  final int currentStep;
  final String? title;
  final String? description;
  // Dodaj ostala polja: features, hashtags, etc.

  const CreateRealEstateState({
    this.currentStep = 0,
    this.title,
    this.description,
  });

  CreateRealEstateState copyWith({
    int? currentStep,
    String? title,
    String? description,
  }) {
    return CreateRealEstateState(
      currentStep: currentStep ?? this.currentStep,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [currentStep, title, description];
}
