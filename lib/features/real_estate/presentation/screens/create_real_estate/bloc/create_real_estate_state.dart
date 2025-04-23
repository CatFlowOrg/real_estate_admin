import 'package:equatable/equatable.dart';

class CreateRealEstateState extends Equatable {
  final int currentStep;
  final String? title;
  final String? description;
  final List<int> selectedHashtags;
  final List<int> selectedFeatures;
  final List<int> selectedExtras;
  final List<String> imagePaths;

  const CreateRealEstateState({
    this.currentStep = 0,
    this.title,
    this.description,
    this.selectedHashtags = const [],
    this.selectedFeatures = const [],
    this.selectedExtras = const [],
    this.imagePaths = const [],
  });

  CreateRealEstateState copyWith({
    int? currentStep,
    String? title,
    String? description,
    List<int>? selectedHashtags,
    List<int>? selectedFeatures,
    List<int>? selectedExtras,
    List<String>? imagePaths,
  }) {
    return CreateRealEstateState(
      currentStep: currentStep ?? this.currentStep,
      title: title ?? this.title,
      description: description ?? this.description,
      selectedHashtags: selectedHashtags ?? this.selectedHashtags,
      selectedFeatures: selectedFeatures ?? this.selectedFeatures,
      selectedExtras: selectedExtras ?? this.selectedExtras,
      imagePaths: imagePaths ?? this.imagePaths,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    title,
    description,
    selectedHashtags,
    selectedFeatures,
    selectedExtras,
    imagePaths,
  ];
}
