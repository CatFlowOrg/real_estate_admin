import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:real_estate_admin/features/real_estate/domain/usecase/get_real_estates.dart';

part 'real_estate_event.dart';

part 'real_estate_state.dart';

@Injectable()
class RealEstateBloc extends Bloc<RealEstateEvent, RealEstateState> {
  final GetRealEstatesUseCase _getRealEstatesUseCase;

  RealEstateBloc(this._getRealEstatesUseCase)
      : super(const RealEstateStateInitial()) {
    on<GetRealEstates>(_getRealEstates);
  }

  Future<void> _getRealEstates(
      GetRealEstates event, Emitter<RealEstateState> emit) async {
    emit(RealEstateStateLoading());
    final dataState = await _getRealEstatesUseCase();
    if (dataState.isSuccess && dataState.data != null) {
      emit(RealEstateStateSuccess(realEstateResponse: dataState.data!));
    } else {
      emit(RealEstateStateError());
    }
  }
}
