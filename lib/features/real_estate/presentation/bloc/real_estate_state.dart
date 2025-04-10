part of 'real_estate_bloc.dart';



abstract class RealEstateState extends Equatable {
  const RealEstateState();

  @override
  List<Object?> get props => [];
}

class RealEstateStateInitial extends RealEstateState {
  const RealEstateStateInitial();
}

class RealEstateStateLoading extends RealEstateState {}

class RealEstateStateSuccess extends RealEstateState {
  final RealEstateResponse realEstateResponse;

  const RealEstateStateSuccess({
    required this.realEstateResponse,
  });

  @override
  List<Object?> get props => [realEstateResponse];
}

class RealEstateStateError extends RealEstateState {}
