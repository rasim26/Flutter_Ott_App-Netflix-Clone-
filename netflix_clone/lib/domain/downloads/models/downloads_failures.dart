import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads_failures.freezed.dart';

@freezed
class DownloadsFailures with _$DownloadsFailures {
  const factory DownloadsFailures.serverFailure() = ServerFailure;
  const factory DownloadsFailures.clientFailure() = ClientFailure;
}
