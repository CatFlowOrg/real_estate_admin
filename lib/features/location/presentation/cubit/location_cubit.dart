import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/location/domain/entites/location_result.dart';
import 'package:real_estate_admin/features/location/domain/usecases/get_location_data_use_case.dart';

part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final GetLocationDataUseCase _getLocationDataUseCase;

  LocationCubit(this._getLocationDataUseCase) : super(LocationInitial());

  Future<void> getLocation() async {
    emit(LocationLoading());
    final location = await _getLocationDataUseCase();
    if (location != null) {
      emit(LocationSuccess(location));
    } else {
      emit(LocationError());
    }
  }
}
