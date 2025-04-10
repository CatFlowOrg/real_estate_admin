part of 'real_estate_bloc.dart';

abstract class RealEstateEvent extends Equatable {
  const RealEstateEvent();

  @override
  List<Object?> get props => [];
}

//Login user
class GetRealEstates extends RealEstateEvent {
  const GetRealEstates();

  @override
  List<Object?> get props => [];
}
