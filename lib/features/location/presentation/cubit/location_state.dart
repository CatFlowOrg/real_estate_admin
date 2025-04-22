part of 'location_cubit.dart';


abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final LocationResult location;
  LocationSuccess(this.location);
}

class LocationError extends LocationState {}
