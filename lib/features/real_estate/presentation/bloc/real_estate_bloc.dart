import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_item.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:real_estate_admin/features/real_estate/domain/usecase/get_real_estate_id_use_case.dart';
import 'package:real_estate_admin/features/real_estate/domain/usecase/get_real_estates_use_case.dart';

part 'real_estate_event.dart';

part 'real_estate_state.dart';

@Injectable()
class RealEstateBloc extends Bloc<RealEstateEvent, RealEstateState> {
  final GetRealEstatesUseCase _getRealEstatesUseCase;
  final GetRealEstateIdUseCase _getRealEstateIdUseCase;

  RealEstateBloc(this._getRealEstatesUseCase, this._getRealEstateIdUseCase)
      : super(const RealEstateStateInitial()) {
    on<GetRealEstates>(_getRealEstates);
    on<GetRealEstateDetails>(_getRealEstateDetails);
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

  Future<void> _getRealEstateDetails(GetRealEstateDetails event, Emitter<RealEstateState> emit)async{
    emit(RealEstateStateLoading());

    final dataState = await _getRealEstateIdUseCase(params: event.id);
    if (dataState.isSuccess && dataState.data != null) {
      emit(RealEstateDetailsSuccess(dataState.data!));
    } else {
      emit(RealEstateStateError());
    }
  }
}
