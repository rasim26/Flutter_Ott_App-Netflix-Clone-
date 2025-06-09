import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
//used to make it singleton function(Abstraction)
// here, when we call IDownloadsRepo , it will replace by DownloadsRepository.
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        final List<Downloads> downloadsList = [];
        log(response.data.toString());
        //cz we need to print dynamic data to check.
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
          // this is how json pass.
          // we passed raw here.
        }
        log(downloadsList.toString());
        return Right(downloadsList);
        // to clear the error like "body might complete normally, causing null ...."
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
      // this is exception handling.
    }
  }
}
