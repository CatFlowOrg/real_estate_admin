part of 'real_estate_bloc.dart';

abstract class RealEstateEvent extends Equatable {
  const RealEstateEvent();

  @override
  List<Object?> get props => [];
}

class GetRealEstates extends RealEstateEvent {
  const GetRealEstates();

  @override
  List<Object?> get props => [];
}
class GetRealEstateDetails extends RealEstateEvent {
  final int id;
  const GetRealEstateDetails(this.id);

  @override
  List<Object?> get props => [id];
}