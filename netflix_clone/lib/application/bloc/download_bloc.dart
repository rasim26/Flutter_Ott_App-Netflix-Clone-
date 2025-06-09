import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';

import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_event.dart';
part 'download_state.dart';

part 'download_bloc.freezed.dart';

@Injectable()
class DownloadBloc extends Bloc<DownloadEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downlaodsFailureOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloads0ption =
          await _downloadsRepo.getDownloadsImages();
      log(downloads0ption.toString());
      emit(downloads0ption.fold(
          // the use of fold function
          //on failure
          (failure) => state.copyWith(
              isLoading: false,
              downlaodsFailureOrSuccessOption: Some(left(failure))),
          // on success
          (downloadz) => state.copyWith(
              isLoading: false,
              downlaodsFailureOrSuccessOption: Some(right(downloadz)))));
      // as DownloadsState Function(List<Downloads> r)));
      // fold is used as , like a switch function such as if left happens what to do
      // or with the right. (that is here , left is main failure and on the right is list<downloads>)
    });
  }
}
