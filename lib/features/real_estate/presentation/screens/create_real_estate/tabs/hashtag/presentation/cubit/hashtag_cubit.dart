import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/domain/get_hashtag_use_case.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/cubit/hashtag_state.dart';


@injectable
class HashtagCubit extends Cubit<HashtagState> {
  final GetHashtagsUseCase _getHashtagsUseCase;

  HashtagCubit(this._getHashtagsUseCase) : super(HashtagInitial());

  Future<void> getHashtags() async {
    emit(HashtagLoading());
    final result = await _getHashtagsUseCase();
    if (result.isSuccess && result.data != null) {
      emit(HashtagLoaded(result.data!));
    } else {
      emit(HashtagError());
    }
  }
}
