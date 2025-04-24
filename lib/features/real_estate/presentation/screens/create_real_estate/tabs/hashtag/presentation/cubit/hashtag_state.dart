import 'package:real_estate_admin/features/real_estate/data/models/hashtag.dart';

abstract class HashtagState {}

class HashtagInitial extends HashtagState {}

class HashtagLoading extends HashtagState {}

class HashtagLoaded extends HashtagState {
  final List<Hashtag> hashtags;

  HashtagLoaded(this.hashtags);
}

class HashtagError extends HashtagState {}
