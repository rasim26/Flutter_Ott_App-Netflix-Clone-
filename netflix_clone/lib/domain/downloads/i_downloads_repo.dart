// this is a repository
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  //enthoke api calls varunnundo enn predict cheyyan.
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
  // here, if we use Either, we can set the laft part as failure situation and right part as success situation.
}
