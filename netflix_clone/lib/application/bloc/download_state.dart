part of 'download_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required List<Downloads>? downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        // true or false option
        downlaodsFailureOrSuccessOption,
  }) = _DownloadsState;
// need to recheck this part
// don't know more about this
  factory DownloadsState.initial() {
    return const DownloadsState(
      isLoading: true,
      downlaodsFailureOrSuccessOption: None(),
      downloads: [],
    );
  }

  // @override
  // DownloadsState copyWith(
  //     {required bool isLoading,
  //     required Option downlaodsFailureOrSuccessOption,
  //     List<Downloads>? downloads}) {}
}
