import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_real_estate_event.dart';
import 'create_real_estate_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateRealEstateBloc extends Bloc<CreateRealEstateEvent, CreateRealEstateState> {
  CreateRealEstateBloc() : super(const CreateRealEstateState()) {
    on<GoToStep>((event, emit) => emit(state.copyWith(currentStep: event.step)));
    on<UpdateRealEstateTitle>((event, emit) => emit(state.copyWith(title: event.title)));
    on<UpdateRealEstateDescription>((event, emit) => emit(state.copyWith(description: event.description)));
    on<UpdateSelectedHashtags>((event, emit) => emit(state.copyWith(selectedHashtags: event.hashtags)));
    on<UpdateSelectedFeatures>((event, emit) => emit(state.copyWith(selectedFeatures: event.features)));
    on<UpdateSelectedExtras>((event, emit) => emit(state.copyWith(selectedExtras: event.extras)));
    on<UpdateImages>((event, emit) => emit(state.copyWith(imagePaths: event.imagePaths)));
  }
}
