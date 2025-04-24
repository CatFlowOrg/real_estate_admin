import 'package:equatable/equatable.dart';

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

class UpdateSelectedHashtags extends CreateRealEstateEvent {
  final List<int> hashtags;
  const UpdateSelectedHashtags(this.hashtags);
  @override
  List<Object?> get props => [hashtags];
}

class UpdateSelectedFeatures extends CreateRealEstateEvent {
  final List<int> features;
  const UpdateSelectedFeatures(this.features);
  @override
  List<Object?> get props => [features];
}

class UpdateSelectedExtras extends CreateRealEstateEvent {
  final List<int> extras;
  const UpdateSelectedExtras(this.extras);
  @override
  List<Object?> get props => [extras];
}

class UpdateImages extends CreateRealEstateEvent {
  final List<String> imagePaths;
  const UpdateImages(this.imagePaths);
  @override
  List<Object?> get props => [imagePaths];
}
